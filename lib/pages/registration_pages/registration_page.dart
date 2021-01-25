import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:easy_hire/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'account_type_selection_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool passUnVisible = true;
  bool confirmPassUnVisible = true;

  Widget passwordTextFieldStyle(String hintText, bool unVisible) {
    return Container(
      padding: EdgeInsets.only(bottom: 12),
      child: TextField(
        obscureText: unVisible,
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
              child: Icon(
                unVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined ,
                color: Color(0xFFB6B7B8),
              ),
              onTap: () {
                setState(() {
                  if (hintText == "Password")
                    passUnVisible = !passUnVisible;
                  else
                    confirmPassUnVisible = !confirmPassUnVisible;
                });
              },
            ),
            filled: true,
            fillColor: Color(0xFFF4F4F4),
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(color: Color(0xFFB6B7B8)),
            contentPadding: EdgeInsets.all(15),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(5),
            )),
      ),
    );
  }

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
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
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
                      ],
                    ),
                    SizedBox(height: 16),
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
                    CustomTextField(hintText:"Last name"),
                    SizedBox(height: 12),
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
                    SizedBox(height: 12),
                    Text(
                      "Password",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF252525),
                      ),
                    ),
                    SizedBox(height: 12),
                    passwordTextFieldStyle("Password", passUnVisible),
                    passwordTextFieldStyle("Сonfirm password", confirmPassUnVisible),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 12),
                Row(
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
                ),
                SizedBox(height: 16),
                CustomButton(
                  isActive: false,
                  title: "Next",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountTypeSelectionPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
