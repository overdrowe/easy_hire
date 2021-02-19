import 'dart:io';
import 'dart:ui';

import 'file:///B:/FlutterProjects/easy_hire/lib/pages/main_pages/main_page_business.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  selectCategoryButton,
                  SizedBox(height: 19),
                  photoId,
                  SizedBox(height: 14),
                  liability,
                  SizedBox(height: 6),
                  licenceNumber,
                  SizedBox(height: 10),
                  offersForHandyman,
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          attentionText,
          SizedBox(height: 10),
          CustomButton(
            title: "Create an account",
            isActive: true,
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPageBusiness()),
                  (Route<dynamic> route) => false);
            },
          ),
          SizedBox(height: 16)
        ],
      ),
    );
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (image != null)
      setState(() {
        files.add(image);
      });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null)
      setState(() {
        files.add(image);
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
    List<Widget> widgetsList = new List<Widget>();
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
          SizedBox(height: 12),
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
          Text(
            "Contractor Licence number",
            style: GoogleFonts.montserrat(
              fontSize: 19,
              color: Color(0xFF252525),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          CustomTextField(
            hintText: "Contractor Licence number",
          ),
        ],
      ),
    );
  }

  Widget get offersForHandyman {
    return Container(
      padding: EdgeInsets.only(top: 10),
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
    return Text(
      "To register as a Licensed contractor,\nyou need to upload the data",
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
        fontSize: 11,
        color: Color(0xFF252525),
      ),
    );
  }
}
