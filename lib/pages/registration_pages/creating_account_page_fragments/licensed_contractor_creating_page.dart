import 'dart:io';
import 'dart:ui';

import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/pages/main_pages/business_pages/main_page_business.dart';
import 'package:easy_hire/pages/main_pages/personal_pages/home_page_personal.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/custom_check_box.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class LicensedContractorCreatingPage extends StatefulWidget {
  @override
  _LicensedContractorCreatingPageState createState() =>
      _LicensedContractorCreatingPageState();
}

class _LicensedContractorCreatingPageState
    extends State<LicensedContractorCreatingPage> {
  List<File> files = new List<File>();

  Future<void> getPicture() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      files.add(image);
    });
  }

  bool checkBoxValue = true;

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
                Icon(Icons.arrow_forward_ios,
                    size: 16, color: Color(0xFFB6B7B8))
              ],
            ),
          ),
        ),
      ),
    );
  }

  get listItem {
    return Container(
      width: 100,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          color: Color(0xFFF4F4F4), borderRadius: BorderRadius.circular(4)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            getPicture();
          },
          child: Container(
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

  get getImageList {
    List<Widget> widgetsList = new List<Widget>();
    widgetsList.add(listItem);

    files.forEach((element) {
      widgetsList.add(Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(element),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.all(4),
      ));
    });
    print(files.length);
    print(widgetsList.length);
    return widgetsList;
  }

  Widget get photoId {
    return Container(
      padding: EdgeInsets.only(top: 24),
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
          SingleChildScrollView(
            physics: ScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: getImageList,
            ),
          ),
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
            "Liability",
            style: GoogleFonts.montserrat(
              fontSize: 19,
              color: Color(0xFF252525),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: "Insurance carrier",
          ),
          CustomTextField(
            hintText: "Policy number",
          ),
        ],
      ),
    );
  }

  Widget get licenceNumber {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16),
          Text(
            "Contractor Licence number",
            style: GoogleFonts.montserrat(
              fontSize: 19,
              color: Color(0xFF252525),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          CustomTextField(
            hintText: "Contractor Licence number",
          ),
        ],
      ),
    );
  }

  Widget get offersForHandyman {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          CustomCheckBox(
            onTap: () {
              setState(() {
                checkBoxValue = !checkBoxValue;
              });
            },
            value: checkBoxValue,
          ),
          SizedBox(width: 16),
          Text(
            "I want to receive offers for Handyman",
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
        "To register as a Licensed contractor,\nyou need to upload the data",
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
      child: SingleChildScrollView(
        physics: ScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 32),
              selectCategoryButton,
              photoId,
              liability,
              licenceNumber,
              offersForHandyman,
              attentionText,
              CustomButton(
                title: "Create an account",
                isActive: true,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPageBusiness()),
                      (Route<dynamic> route) => false);
                },
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
