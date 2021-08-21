import 'dart:io';

import 'package:easy_hire/services/account_data.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main_pages/main_page_business.dart';
import '../main_pages/main_page_personal.dart';

class AddFilesPage extends StatefulWidget {
  @override
  _AddFilesPageState createState() => _AddFilesPageState();
}

class _AddFilesPageState extends State<AddFilesPage> {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          "Add files",
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AccountData().accountType == AccountType.personal ? MainPagePersonal() : MainPageBusiness()),
                (Route<dynamic> route) => false);
          },
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GridView.count(
                  physics: ScrollPhysics(
                    parent: BouncingScrollPhysics(),
                  ),
                  crossAxisCount: 2,
                  children: getImageList,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4.0),
                child: CustomButton(
                  title: "Create project",
                  isActive: true,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountData().accountType == AccountType.personal
                                ? MainPagePersonal()
                                : MainPageBusiness()),
                        (Route<dynamic> route) => false);
                  },
                ),
              )
            ],
          ),
        ));
  }

  get listItem {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(color: Color(0xFFF4F4F4), borderRadius: BorderRadius.circular(4)),
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
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(element),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
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
      );
    });
    widgetsList.add(listItem);
    return widgetsList;
  }

  List<File> files = [];

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
        });
  }
}
