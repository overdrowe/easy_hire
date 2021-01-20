import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'location_page.dart';

class AccountTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("Registration"),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF252525),
                      fontSize: 16.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomButton(
                    isActive: true,
                    title: "Personal",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationPage()));
                    },
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Color(0xFF252525),
                      fontSize: 16.5,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomButton(
                    isActive: true,
                    title: "Bisiness",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationPage()));
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "After registration, you can change the type of account",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Color(0xFF252525),
                  fontSize: 16.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
