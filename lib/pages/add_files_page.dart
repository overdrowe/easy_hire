import 'dart:io';

import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main_pages/business_pages/main_page_business.dart';
import 'main_pages/personal_pages/main_page_personal.dart';

class AddFilesPage extends StatefulWidget {
  @override
  _AddFilesPageState createState() => _AddFilesPageState();
}

class _AddFilesPageState extends State<AddFilesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar("Add files", onTap: (){
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                  AccountData().accountType == AccountType.personal
                      ? MainPagePersonal()
                      : MainPageBusiness()),
                  (Route<dynamic> route) => false);
        },),
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
                        MaterialPageRoute(builder: (context) => AccountData().accountType == AccountType.personal
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

  List<File> files = new List<File>();

  Future<void> getPicture() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      files.add(image);
    });
  }

  get getImageList {
    List<Widget> widgetsList = new List<Widget>();
    widgetsList.add(listItem);

    files.forEach((element) {
      widgetsList.add(Container(
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

}
