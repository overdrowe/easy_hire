import 'file:///B:/FlutterProjects/easy_hire/lib/pages/registration_pages/registration_page/registration_page.dart';
import 'package:easy_hire/singleton/account_data.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AccountTypeSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("Registration"),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
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
                    SizedBox(height: 10),
                    CustomButton(
                      isActive: true,
                      title: "Personal",
                      onPressed: () {
                        AccountData().accountType = AccountType.personal;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Color(0xFF252525),
                        fontSize: 16.5,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      isActive: true,
                      title: "Business",
                      onPressed: () {
                        AccountData().accountType = AccountType.business;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36),
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
      ),
    );
  }
}
