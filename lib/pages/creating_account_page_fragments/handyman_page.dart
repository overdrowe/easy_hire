import 'dart:ui';

import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HandymanPage extends StatefulWidget {
  @override
  _HandymanPagePageState createState() => _HandymanPagePageState();
}

class _HandymanPagePageState extends State<HandymanPage> {
  bool checkBoxValue = true;
  bool confirmCheckBoxValue = false;

  Widget get selectCategoryButton {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Color(0xFFF4F4F4),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "select a category",
                  style: GoogleFonts.montserrat(
                      fontSize: 16, color: Color(0xFFB6B7B8)),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    size: 16, color: Color(0xFFB6B7B8))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listItem(Image img) {
    return img != null
        ? Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4)),
          )
        : Container(
            decoration: BoxDecoration(
                color: Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(4)),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () {},
                child: Container(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.add,
                    color: Color(0xFF252525).withOpacity(0.2),
                    size: 60,
                  ),
                ),
              ),
            ),
          );
  }

  Widget horizontalList() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 100.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            listItem(null),
          ],
        ));
  }

  Widget get photoId {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Photo ID",
            style: GoogleFonts.montserrat(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xFF252525)),
          ),
          horizontalList(),
        ],
      ),
    );
  }

  Widget get liability {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Liability insurance information",
            style: GoogleFonts.montserrat(
              fontSize: 19,
              color: Color(0xFF252525),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "Having insurance greatly increases chances to be hired.",
            style: GoogleFonts.montserrat(
              fontSize: 11,
              color: Color(0xFF252525),
            ),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "Insurance carrier",
                hintStyle: GoogleFonts.montserrat(color: Color(0xFFB6B7B8)),
                contentPadding: EdgeInsets.all(15),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(6),
                )),
          ),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "Policy number",
                hintStyle: GoogleFonts.montserrat(color: Color(0xFFB6B7B8)),
                contentPadding: EdgeInsets.all(15),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(6),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(6),
                )),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xFF42B39B)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(4),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        "Optional",
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Color(0xFF252525),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget checkBoxDecoration(VoidCallback onTap, bool value) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 24,
          width: 24,
          decoration: value
              ? BoxDecoration(
                  color: Color(0xFF42B39B),
                  borderRadius: BorderRadius.circular(4))
              : BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xFFB6B7B8), width: 2),
                  borderRadius: BorderRadius.circular(4)),
          child: value
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Container()),
    );
  }

  Widget customCheckBox({String text, VoidCallback onTap, bool value}) {
    return Container(
      child: Row(
        children: [
          checkBoxDecoration(onTap, value),
          SizedBox(width: 16),
          Text(
            "All information is true and up to date",
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: Color(0xFF252525),
            ),
          ),
        ],
      ),
    );
  }

  Widget get attentionText {
    return Padding(
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Text(
        "To register as a Handyman, you need to upload your data",
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: 12,
          color: Color(0xFF252525),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 32),
                  photoId,
                  liability,
                  SizedBox(height: 8),
                  customCheckBox(value: checkBoxValue, text: "Get notifications about projects", onTap: (){
                    setState(() {
                      checkBoxValue = !checkBoxValue;
                    });
                  }),
                  SizedBox(height: 16),
                  customCheckBox(value: confirmCheckBoxValue, text: "All information is true and up to date", onTap: (){
                    setState(() {
                      confirmCheckBoxValue = !confirmCheckBoxValue;
                    });
                  }),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                attentionText,
                CustomButton(
                  title: "Create an account",
                  isActive: confirmCheckBoxValue,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 16,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
