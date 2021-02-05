import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/password_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EnterNewPasswordPage extends StatefulWidget {
  @override
  _EnterNewPasswordPageState createState() =>
      _EnterNewPasswordPageState();
}

class _EnterNewPasswordPageState extends State<EnterNewPasswordPage> {
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
                    "Enter new password",
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
              title: "Edit password",
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
