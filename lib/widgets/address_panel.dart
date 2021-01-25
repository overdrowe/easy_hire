import 'file:///B:/FlutterProjects/easy_hire/lib/pages/registration_pages/location_selection_page.dart';
import 'file:///B:/FlutterProjects/easy_hire/lib/pages/registration_pages/search_location_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressPanel extends StatefulWidget {

  final String addressName;

  const AddressPanel({Key key, this.addressName}) : super(key: key);

  @override
  _AddressPanelState createState() => _AddressPanelState();
}

class _AddressPanelState extends State<AddressPanel> {


  Widget get customDivider {
    return Divider(
      color: Color(0xFFB6B7B8),
      height: 2,
      thickness: 0.5,
      indent: 16,
      endIndent: 16,
    );
  }

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
                        builder: (context) => SearchLocationPage()));
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Text(widget.addressName,
                      style: GoogleFonts.montserrat(
                          fontSize: 16, color: Color(0xFFB6B7B8)))),
            ),
          ),
          customDivider,
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.near_me),
                    SizedBox(width: 8),
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
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
                        builder: (context) => LocationSelectedPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
