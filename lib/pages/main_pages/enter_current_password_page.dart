import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'enter_new_password_page.dart';

class EnterCurrentPasswordPage extends StatefulWidget {
  @override
  _EnterCurrentPasswordPageState createState() =>
      _EnterCurrentPasswordPageState();
}

class _EnterCurrentPasswordPageState extends State<EnterCurrentPasswordPage> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        "Enter Password",
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
              padding: const EdgeInsets.only(top: 75.0),
              child: Column(
                children: [
                  Text(
                    "To change your password, enter your old password",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Color(0xFF252525),
                    ),
                  ),
                  SizedBox(height: 32),
                  PasswordTextField(
                    hintText: "Password",
                    unVisible: passwordVisible,
                    onTap: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  )
                ],
              ),
            ),
            CustomButton(
              title: "Next",
              isActive: false,
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EnterNewPasswordPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
