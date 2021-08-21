import 'dart:io';

import 'package:easy_hire/services/account_data.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ImagePicker _imagePicker = ImagePicker();

  bool passwordVisible = false;
  File file = AccountData().avatarImageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        "Edit profile",
        automaticallyImplyActions: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  avatar,
                  SizedBox(height: 10),
                  CustomTextField(hintText: "First name"),
                  CustomTextField(hintText: "Last name"),
                ],
              ),
            ),
            CustomButton(
              title: "Edit profile",
              isActive: false,
              onPressed: () {
                AccountData().avatarImageFile = file;
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  get avatar {
    return Stack(
      children: [
        Container(
          decoration:
              BoxDecoration(color: Color(0xFFF4F4F4), shape: BoxShape.circle),
          child: Material(
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
                                image: FileImage(file), fit: BoxFit.cover),
                            shape: BoxShape.circle),
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.person,
                          color: Colors.transparent,
                          size: 80,
                        ))),
          ),
        ),
        Positioned(
          right: 8,
          bottom: 8,
          child: Container(
            child: Icon(Icons.add_a_photo_outlined),
          ),
        )
      ],
    );
  }

  _imgFromCamera() async {
    PickedFile pickedFile = await _imagePicker.getImage(source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);
    if (pickedFile != null)
      setState(() {
        file = File(pickedFile.path);
      });
  }

  _imgFromGallery() async {
    PickedFile pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
    if (pickedFile != null)
      setState(() {
        file = File(pickedFile.path);
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
}
