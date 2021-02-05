import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:easy_hire/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditUserNamePage extends StatefulWidget {
  @override
  _EditUserNamePageState createState() =>
      _EditUserNamePageState();
}

class _EditUserNamePageState extends State<EditUserNamePage> {
  bool passwordVisible = false;

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
              padding: EdgeInsets.only(top: 24.0),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0xFFF4F4F4),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.person,
                        color: Color(0xFFE9E9E9),
                        size: 80,
                      )),
                  SizedBox(height: 12),
                  CustomTextField(hintText: "First name"),
                  CustomTextField(hintText: "Last name"),
                ],
              ),
            ),
            CustomButton(
              title: "Edit profile",
              isActive: false,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
