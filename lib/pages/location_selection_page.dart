import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:easy_hire/map_style/google_map_style.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationSelectedPage extends StatefulWidget {
  @override
  _LocationSelectedPageState createState() => _LocationSelectedPageState();
}

class _LocationSelectedPageState extends State<LocationSelectedPage> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Uint8List markerIcon;
  GoogleMapController _controller;
  double zoom = 18;
  double currentLatitude;
  double currentLongitude;

  @override
  void initState() {
    super.initState();
    getBytesFromAsset('assets/images/map_marker.png', 200)
        .then((value) => markerIcon = value);
  }

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  void updateMarkerAndCircle(double latitude, double longitude) {
    LatLng latlng = LatLng(latitude, longitude);
    this.setState(() {
      marker = Marker(
        markerId: MarkerId("home"),
        position: latlng,
        draggable: false,
        zIndex: 2,
        flat: true,
        anchor: Offset(0.5, 0.5),
        icon: BitmapDescriptor.fromBytes(markerIcon),
      );
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  void getCurrentLocation() async {
    try {
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location.latitude, location.longitude);

      if (_controller != null) {
        _controller.animateCamera(CameraUpdate.newCameraPosition(
            new CameraPosition(
                target: LatLng(location.latitude, location.longitude),
                tilt: 0,
                zoom: zoom)));
        updateMarkerAndCircle(location.latitude, location.longitude);
      }

      // if (_locationSubscription != null) {
      //   _locationSubscription.cancel();
      // }
      //
      // _locationSubscription =
      //     _locationTracker.onLocationChanged().listen((newLocalData) {
      //   if (_controller != null) {
      //     _controller
      //         .animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
      //             // bearing: 192.8334901395799,
      //             target: LatLng(newLocalData.latitude, newLocalData.longitude),
      //             tilt: 0,
      //             zoom: 18.00)));
      //     updateMarkerAndCircle(newLocalData.latitude, newLocalData.longitude);
      //   }
      // });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("location"),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: initialLocation,
                  markers: Set.of((marker != null) ? [marker] : []),
                  // circles: Set.of((circle != null) ? [circle] : []),
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      controller.setMapStyle(Utils.mapStyle);
                    });
                    _controller = controller;
                  },
                  onTap: (value) async {
                    currentLatitude = value.latitude;
                    currentLongitude = value.longitude;
                    if (_controller != null) {
                      _controller.animateCamera(CameraUpdate.newCameraPosition(
                          new CameraPosition(
                              target: LatLng(value.latitude, value.longitude),
                              tilt: 0,
                              zoom: zoom)));
                      updateMarkerAndCircle(value.latitude, value.longitude);
                    }
                  },
                  zoomControlsEnabled: false,
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      color: Color(0xFF252525).withOpacity(0.8),
                    ),
                    child: IconButton(
                      onPressed: () {
                        getCurrentLocation();
                      },
                      icon: Icon(
                        Icons.near_me,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: MediaQuery.of(context).size.height / 2 - 150,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      color: Color(0xFF252525).withOpacity(0.8),
                    ),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            zoom++;
                            if (_controller != null) {
                              _controller.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                      new CameraPosition(
                                          target: LatLng(currentLatitude,
                                              currentLongitude),
                                          tilt: 0,
                                          zoom: zoom)));
                            }
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            zoom--;
                            if (_controller != null) {
                              _controller.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                      new CameraPosition(
                                          target: LatLng(currentLatitude,
                                              currentLongitude),
                                          tilt: 0,
                                          zoom: zoom)));
                            }
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Street selected:",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        letterSpacing: -0.24,
                        color: Color(0xFF252525),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text("1901 Thornridge Cir. Shiloh, Hawaii 81063",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: Color(0xFF252525),
                    )),
                SizedBox(height: 16),
                CustomButton(
                  title: "Done",
                  onPressed: () {},
                  isActive: true,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
