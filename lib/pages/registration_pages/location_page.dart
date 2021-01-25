import 'file:///B:/FlutterProjects/easy_hire/lib/pages/registration_pages/location_selection_page.dart';
import 'file:///B:/FlutterProjects/easy_hire/lib/pages/registration_pages/search_location_page.dart';
import 'package:easy_hire/widgets/address_panel.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'creating_account_page.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  Widget get customDivider {
    return Divider(
      color: Color(0xFFB6B7B8),
      height: 2,
      thickness: 0.5,
      indent: 16,
      endIndent: 16,
    );
  }

  Widget locationHistoryItem({@required String text}) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 13,
            color: Color(0xFF252525),
          ),
        ),
      ),
      onTap: () {
        print("Was taped: " + text);
      },
    );
  }

  Widget get locationHistory {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFFF4F4F4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
              child: Text("History",
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Color(0xFF252525),
                      fontWeight: FontWeight.bold))),
          locationHistoryItem(
              text: "4517 Washington Ave. Manchester, Kentucky 39495"),
          customDivider,
          locationHistoryItem(
              text: "2118 Thornridge Cir. Syracuse, Connecticut 35624"),
          customDivider,
          locationHistoryItem(
              text: "1901 Thornridge Cir. Shiloh, Hawaii 81063"),
          customDivider,
          locationHistoryItem(text: "8502 Preston Rd. Inglewood, Maine 98380"),
          customDivider,
          locationHistoryItem(text: "8502 Preston Rd. Inglewood, Maine 98380"),
          customDivider,
          locationHistoryItem(
              text: "3891 Ranchview Dr. Richardson, California 62639"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("location"),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                AddressPanel(addressName: "Address",),
                SizedBox(height: 16),
                locationHistory,
              ],
            ),
            CustomButton(
              title: "Next",
              isActive: false,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatingAccountPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
