import 'dart:io';
import 'dart:ui';

import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/pages/main_pages/main_page_business.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/custom_check_box.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HandymanCreatingPage extends StatefulWidget {
  @override
  _HandymanPagePageState createState() => _HandymanPagePageState();
}

class _HandymanPagePageState extends State<HandymanCreatingPage> {
  final ImagePicker _imagePicker = ImagePicker();

  bool checkBoxValue = true;
  bool confirmCheckBoxValue = false;
  List<File> files = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: ScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30),
                  photoId,
                  SizedBox(height: 14),
                  liability,
                  SizedBox(height: 16),
                  customCheckBox(
                      value: checkBoxValue,
                      text: "Get notifications about projects",
                      onTap: () {
                        setState(() {
                          checkBoxValue = !checkBoxValue;
                        });
                      }),
                  SizedBox(height: 16),
                  customCheckBox(
                      value: confirmCheckBoxValue,
                      text: "All information is true and up to date",
                      onTap: () {
                        setState(() {
                          confirmCheckBoxValue = !confirmCheckBoxValue;
                        });
                      }),
                ],
              ),
            ),
          ),
          attentionText,
          SizedBox(height: 6),
          CustomButton(
            title: "Create an account",
            isActive: confirmCheckBoxValue,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPageBusiness()),
                  (Route<dynamic> route) => false);
            },
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  _imgFromCamera() async {
    PickedFile pickedFile = await _imagePicker.getImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (pickedFile != null)
      setState(() {
        files.add(File(pickedFile.path));
      });
  }

  _imgFromGallery() async {
    PickedFile pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null)
      setState(() {
        files.add(File(pickedFile.path));
      });
  }

  _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  Widget horizontalList() {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 100.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            listItem(),
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
          SizedBox(height: 12),
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

  get listItem {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Color(0xFFF4F4F4), borderRadius: BorderRadius.circular(4)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            _showPicker(context);
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
    List<Widget> widgetsList = [];
    files.forEach((element) {
      widgetsList.add(
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.luminosity),
                    image: FileImage(element),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Positioned(
                right: 4,
                top: 4,
                child: InkWell(
                    onTap: () {
                      setState(() {
                        files.remove(element);
                      });
                    },
                    child: Icon(
                      Icons.close,
                      color: Color(0xFFE9E9E9).withOpacity(0.7),
                    )),
              ),
            ],
          ),
        ),
      );
    });
    widgetsList.add(listItem);
    return widgetsList;
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
          CustomTextField(
            hintText: "Insurance carrier",
            onChanged: (value) {},
          ),
          CustomTextField(
            hintText: "Policy number",
            onChanged: (value) {},
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppStyle().mainColor),
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
                          color: Colors.white,
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

  Widget customCheckBox({String text, VoidCallback onTap, bool value}) {
    return Container(
      child: Row(
        children: [
          CustomCheckBox(onTap: onTap, value: value),
          SizedBox(width: 16),
          Text(
            text,
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
    return Text(
      "To register as a Handyman, you need to upload your data",
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: 11,
        color: Color(0xFF252525),
      ),
    );
  }
}
