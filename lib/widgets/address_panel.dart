import 'package:easy_hire/pages/location_page/location_selection_page.dart';
import 'package:easy_hire/pages/location_page/search_location_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressPanel extends StatefulWidget {

  final String addressName;

  final Function(String) onChanged;

  const AddressPanel({Key key, this.addressName, @required this.onChanged}) : super(key: key);

  @override
  _AddressPanelState createState() => _AddressPanelState();
}

class _AddressPanelState extends State<AddressPanel> {


  Widget get customDivider {
    return Divider(
      color: Color(0xFFB6B7B8),
      height: 2,
      thickness: 0.5,
      indent: 12,
      endIndent: 12,
    );
  }

  String _selectedAddress;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFFF4F4F4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchLocationPage())).then((value) {
                  changeAddress(value);
                });
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Text(_selectedAddress ?? widget.addressName,
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Color(0xFFB6B7B8)))),
            ),
          ),
          customDivider,
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LocationSelectedPage(findCurrentLocation: true))).then((value) {
                  changeAddress(value);
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Row(
                  children: [
                    Icon(Icons.near_me),
                    SizedBox(width: 10),
                    Text("my location",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, color: Color(0xFF252525))),
                  ],
                ),
              ),
            ),
          ),
          customDivider,
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                child: Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(width: 8),
                    Text("specify on the map",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, color: Color(0xFF252525)))
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LocationSelectedPage())).then((value) {
                  changeAddress(value);
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void changeAddress(String value){
    if (value != "" && value != null)
    setState(() {
      _selectedAddress = value;
      if(widget.onChanged != null) widget.onChanged(_selectedAddress);
      print(_selectedAddress);
    });
  }
}
