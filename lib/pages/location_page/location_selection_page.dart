import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:easy_hire/map_style/google_map_style.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationSelectedPage extends StatefulWidget {
  final bool findCurrentLocation;

  const LocationSelectedPage({Key key, this.findCurrentLocation = false}) : super(key: key);

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
  LatLng currentPosition = LatLng(37.42796133580664, -122.085749655962);
  String address = "";

  @override
  void initState() {
    super.initState();
    getBytesFromAsset('assets/images/map_marker.png', 100).then((value) => markerIcon = value);

    if (widget.findCurrentLocation) getCurrentLocation();
  }

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 18,
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
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png)).buffer.asUint8List();
  }

  void getCurrentLocation() async {
    try {
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location.latitude, location.longitude);

      if (_controller != null) {
        _controller.animateCamera(CameraUpdate.newCameraPosition(
            new CameraPosition(target: LatLng(location.latitude, location.longitude), tilt: 0, zoom: 18)));
        updateMarkerAndCircle(location.latitude, location.longitude);
        Geocoder.local
            .findAddressesFromCoordinates(new Coordinates(location.latitude, location.longitude))
            .then((value) => {
                  super.setState(() {
                    address = value.first.addressLine;
                  })
                });
      }
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
    getBytesFromAsset('assets/images/map_marker.png', 64).then((value) => markerIcon = value);
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
                  onMapCreated: (GoogleMapController controller) {
                    setState(() {
                      controller.setMapStyle(Utils.mapStyle);
                    });
                    _controller = controller;
                  },
                  onCameraMove: (CameraPosition position) {
                    currentPosition = position.target;
                  },
                  onTap: (value) async {
                    if (_controller != null) {
                      Geocoder.local
                          .findAddressesFromCoordinates(new Coordinates(value.latitude, value.longitude))
                          .then((value) => {
                                super.setState(() {
                                  address = value.first.addressLine;
                                })
                              });
                      _controller.animateCamera(CameraUpdate.newCameraPosition(
                          new CameraPosition(target: LatLng(value.latitude, value.longitude), tilt: 0, zoom: 18)));
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
                    child: Material(
                      color: Colors.transparent,
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
                ),
                Positioned(
                  right: 16,
                  bottom: MediaQuery.of(context).size.height / 2 - 150,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      color: Color(0xFF252525).withOpacity(0.8),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              zoom++;
                              if (_controller != null) {
                                _controller.animateCamera(CameraUpdate.newCameraPosition(
                                    new CameraPosition(target: currentPosition, tilt: 0, zoom: zoom)));
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
                                _controller.animateCamera(CameraUpdate.newCameraPosition(
                                    new CameraPosition(target: currentPosition, tilt: 0, zoom: zoom)));
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
                        fontSize: 15, letterSpacing: -0.24, color: Color(0xFF252525), fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(address,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: Color(0xFF252525),
                    )),
                SizedBox(height: 16),
                CustomButton(
                  title: "Done",
                  onPressed: () {
                    Navigator.of(context).pop(address);
                  },
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
