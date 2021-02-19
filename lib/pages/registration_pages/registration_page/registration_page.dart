import 'dart:io';
import 'dart:ui';

import 'file:///B:/FlutterProjects/easy_hire/lib/pages/main_pages/main_page_personal.dart';
import 'package:easy_hire/pages/location_page/location_page.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:easy_hire/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool passUnVisible = true;
  bool confirmPassUnVisible = true;

  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("Registration"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    avatar,
                    SizedBox(height: 16),
                    nameField,
                    SizedBox(height: 8),
                    emailField,
                    SizedBox(height: 13),
                    passwordField,
                  ],
                ),
              ),
            ),
          ),
          bottomBlock
        ],
      ),
    );
  }

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (image != null)
      setState(() {
        file = image;
      });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null)
      setState(() {
        file = image;
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
                  file != null ? new ListTile(
                      leading: new Icon(Icons.delete),
                      title: new Text('Delete photo'),
                      onTap: () {
                        setState(() {
                          file = null;
                        });
                        Navigator.of(context).pop();
                      }) : Container(),
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
        });
  }

  get avatar {
    return Container(
      decoration:
          BoxDecoration(color: Color(0xFFF4F4F4), shape: BoxShape.circle),
      child: Center(
        child: Stack(
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                  customBorder: CircleBorder(),
                  onTap: () {
                    _showPicker(context);
                  },
                  child: file == null
                      ? Container(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.person,
                            color: Color(0xFFE9E9E9),
                            size: 80,
                          ))
                      : Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(file), fit: BoxFit.contain),
                              shape: BoxShape.circle),
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            Icons.person,
                            color: Colors.transparent,
                            size: 80,
                          ))),
            ),
            Positioned(
              right: 8,
              bottom: 8,
              child: Container(
                child: Icon(Icons.add_a_photo_outlined),
              ),
            )
          ],
        ),
      ),
    );
  }

  get nameField {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Your name",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525),
          ),
        ),
        SizedBox(height: 12),
        CustomTextField(hintText: "First name"),
        CustomTextField(hintText: "Last name"),
      ],
    );
  }

  get emailField {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "E-mail",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525),
          ),
        ),
        SizedBox(height: 12),
        CustomTextField(hintText: "E-mail"),
      ],
    );
  }

  get passwordField {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Password",
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525),
          ),
        ),
        SizedBox(height: 12),
        PasswordTextField(
          hintText: "Password",
          unVisible: passUnVisible,
          onTap: () {
            setState(() {
              passUnVisible = !passUnVisible;
            });
          },
        ),
        PasswordTextField(
          hintText: "Password",
          unVisible: confirmPassUnVisible,
          onTap: () {
            setState(() {
              confirmPassUnVisible = !confirmPassUnVisible;
            });
          },
        ),
      ],
    );
  }

  get privacyPolicyField {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "by registering you accept the ",
          style: GoogleFonts.montserrat(
            fontSize: 15,
            color: Color(0xFFB6B7B8),
          ),
        ),
        GestureDetector(
          child: Text(
            "privacy policy",
            style: GoogleFonts.montserrat(
              decoration: TextDecoration.underline,
              fontSize: 15,
              color: Color(0xFF252525),
            ),
          ),
          onTap: () {},
        )
      ],
    );
  }

  get nextBtn {
    return CustomButton(
      isActive: false,
      title: "Next",
      onPressed: () {
        AccountData().avatarImageFile = file;

        if (AccountData().accountType == AccountType.business)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LocationPage(),
            ),
          );
        else
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MainPagePersonal()),
              (Route<dynamic> route) => false);
      },
    );
  }

  get bottomBlock {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12),
          privacyPolicyField,
          SizedBox(height: 16),
          nextBtn
        ],
      ),
    );
  }
}
