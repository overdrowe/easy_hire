import 'dart:math';

import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchLocationPage extends StatefulWidget {
  @override
  _SearchLocationPageState createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  Widget get suggestedLocationOptions {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFFF4F4F4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          locationHistoryItem(
              text: "4517 Washington Ave. Manchester, Kentucky 39495"),
          customDivider,
          locationHistoryItem(
              text: "2118 Thornridge Cir. Syracuse, Connecticut 35624"),
          customDivider,
          locationHistoryItem(
              text: "1901 Thornridge Cir. Shiloh, Hawaii 81063"),
          customDivider,
          locationHistoryItem(
              text: "8502 Preston Rd. Inglewood, Maine 98380"),
          customDivider,
          locationHistoryItem(
              text: "8502 Preston Rd. Inglewood, Maine 98380"),
          customDivider,
          locationHistoryItem(
              text: "3891 Ranchview Dr. Richardson, California 62639"),
        ],
      ),
    );
  }

  Widget locationHistoryItem({@required String text}) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
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

  Widget get customDivider {
    return Divider(
      color: Color(0xFFB6B7B8),
      height: 2,
      thickness: 0.3,
      indent: 16,
      endIndent: 16,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("location"),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xFFF4F4F4)),
              padding: EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Color(0xFF252525),
                      ),
                      decoration: InputDecoration(
                        suffixIcon: Transform.rotate(
                          angle: pi / 4,
                          child: IconButton(
                            icon: Icon(
                              Icons.add_circle_sharp,
                              color: Color(0xFF252525).withOpacity(0.7),
                            ),
                            onPressed: null,
                          ),
                        ),
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.montserrat(
                          fontSize: 16,
                          color: Color(0xFF252525),
                        ),
                        hintText: "Manchester",
                      ),
                      onChanged: (value) {},
                    ),
                    suggestedLocationOptions
                  ],
                ),
              ),
            ),
            CustomButton(
              title: "Next",
              isActive: false,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
