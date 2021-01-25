import 'package:easy_hire/widgets/address_panel.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/custom_radio.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:easy_hire/widgets/huge_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'registration_pages/add_files_page.dart';

class PlumbingPage extends StatefulWidget {
  @override
  _PlumbingPageState createState() => _PlumbingPageState();
}

class _PlumbingPageState extends State<PlumbingPage> {
  int _radioValue = 0;
  int _specialistRadioValue = 0;
  String descriptionText = "";

  get specialistRadioGroup => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Text("Specialist",
                style: GoogleFonts.montserrat(
                    fontSize: 19,
                    color: Color(0xFF252525),
                    letterSpacing: 0.38,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            radioRow(
                text: "All",
                value: 0,
                groupValue: _specialistRadioValue,
                onTap: () {
                  setState(() {
                    _specialistRadioValue = 0;
                  });
                }),
            radioRow(
                text: "Licensed contractor",
                value: 1,
                groupValue: _specialistRadioValue,
                onTap: () {
                  setState(() {
                    _specialistRadioValue = 1;
                  });
                }),
            radioRow(
                text: "Handyman",
                value: 2,
                groupValue: _specialistRadioValue,
                onTap: () {
                  setState(() {
                    _specialistRadioValue = 2;
                  });
                }),
          ],
        ),
      );

  get descriptionTextField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          Text("Description",
              style: GoogleFonts.montserrat(
                  fontSize: 19,
                  color: Color(0xFF252525),
                  letterSpacing: 0.38,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          HugeTextField(
            hintText: "Add description",
            text: descriptionText,
            onChanged: (value) {
              setState(() {
                descriptionText = value;
              });
            },
          ),
        ],
      );

  get locationField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          Text("Location",
              style: GoogleFonts.montserrat(
                  fontSize: 19,
                  color: Color(0xFF252525),
                  letterSpacing: 0.38,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          AddressPanel(addressName: "Add address"),
        ],
      );

  get whenToStartField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("When to start",
              style: GoogleFonts.montserrat(
                  fontSize: 19,
                  color: Color(0xFF252525),
                  letterSpacing: 0.38,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          radioRow(
              text: "Now",
              value: 0,
              groupValue: _radioValue,
              onTap: () {
                setState(() {
                  _radioValue = 0;
                });
              }),
          radioRow(
              text: "Choose a date",
              value: 1,
              groupValue: _radioValue,
              onTap: () {
                setState(() {
                  _radioValue = 1;
                });
              }),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                hintText: "Add date",
              )),
              SizedBox(width: 8),
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFF4F4F4),
                  ),
                  padding: EdgeInsets.all(13),
                  child: Icon(Icons.calendar_today),
                ),
              )
            ],
          ),
        ],
      );

  get budgetTextField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Budget",
              style: GoogleFonts.montserrat(
                  fontSize: 19,
                  color: Color(0xFF252525),
                  letterSpacing: 0.38,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          CustomTextField(
            hintText: "Add project",
          ),
        ],
      );

  get projectTitleTextField => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Project title",
              style: GoogleFonts.montserrat(
                  fontSize: 19,
                  color: Color(0xFF252525),
                  letterSpacing: 0.38,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          CustomTextField(
            hintText: "Add project",
          ),
        ],
      );

  Widget radioRow(
      {String text, int value, int groupValue, VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: GoogleFonts.montserrat(
                fontSize: 17,
                color: Color(0xFF252525),
              )),
          CustomRadio(
            value: value,
            groupValue: groupValue,
            onTap: onTap,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Plumbing"),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              projectTitleTextField,
              budgetTextField,
              whenToStartField,
              locationField,
              descriptionTextField,
              specialistRadioGroup,
              SizedBox(height: 32),
              CustomButton(
                title: "Next",
                isActive: true,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddFilesPage()));
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
