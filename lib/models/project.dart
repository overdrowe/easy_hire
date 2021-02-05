import 'dart:io';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Project {
  final String title;
  final int price;
  final String address;
  final String description;
  final String type;
  final String note;
  final DateTime date;
  final List<File> photos;

  Project(
      {this.description,
      this.type,
      this.note,
      @required this.title,
      this.price,
      this.address,
      this.date,
      this.photos});

  Widget getProjectItem({VoidCallback onTap, bool automaticallyImplyDivider}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF252525)),
                    ),
                    Text(
                      r"Up to $" + price.toString(),
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Color(0xFF252525)),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        address ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Color(0xFFB6B7B8),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    date != null
                        ? Text(
                            DateFormat('M/d/yy').format(date),
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Color(0xFFB6B7B8),
                            ),
                          )
                        : Container(),
                  ],
                ),
                photos != null ? Container() : Container(),
              ],
            ),
          ),
        ),
        automaticallyImplyDivider == false
            ? Container()
            : Divider(
                height: 1,
                thickness: 0.5,
                color: Color(0xFFB6B7B8),
              )
      ],
    );
  }
}
