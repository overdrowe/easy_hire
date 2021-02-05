import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Review {
  final String userName;
  final Picture userAvatar;
  final String reviewText;
  final ReviewValue reviewValue;
  final DateTime date;

  Review(this.userName, this.reviewText, this.reviewValue, this.date,
      {this.userAvatar});

  Widget getReviewWidget() {
    return Container(
      child: Row(
        children: [
          avatar,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                accountName,
                textField,
                dateWidget,
              ],
            ),
          )
        ],
      ),
    );
  }


  get dateWidget {
    return Padding(
      padding: const EdgeInsets.only(top: 8, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          reviewValue == ReviewValue.like ? SvgPicture.asset('assets/icons/like.svg') : SvgPicture.asset('assets/icons/dislike.svg'),
          Text(
              DateFormat('M/d/yy').format(date),
              style: GoogleFonts.montserrat(
                fontSize: 10,
                color: Color(0xFF252525),
              )),
        ],
      ),
    );
  }

  get textField {
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 16),
      child: Text(
          reviewText,
          style: GoogleFonts.montserrat(
          fontSize: 10,
          color: Color(0xFFB6B7B8),
      )),
    );
  }

  get accountName {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            userName,
            style: GoogleFonts.montserrat(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color(0xFF252525),
            ),
          ),
          Icon(
            Icons.arrow_forward,
            color: Color(0xFF252525),
            size: 17,
          )
        ],
      ),
    );
  }

  get avatar {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/image1.jpg'),
        ),
      ),
    );
  }
}

enum ReviewValue { like, dislike }
