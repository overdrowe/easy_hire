import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'registration_pages/verify_phone_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  Widget buttonWithLeadingLogo(String imgLink, String title, Color color) {
    return Padding(
      padding: EdgeInsets.only(top: 12),
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imgLink,
              height: 24.0,
              width: 24.0,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.w500,
                letterSpacing: -0.41,
              ),
            ),
            SizedBox(
              width: 24,
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: color,
        onPressed: () {},
      ),
    );
  }

  Widget dividerWithText(String text) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        width: 80,
                        image: AssetImage('assets/images/logo.png'),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "YouHire",
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.36,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Phone number",
                            contentPadding: EdgeInsets.all(15),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            )),
                        onChanged: (value){
                          phoneNumber = value;
                        },
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      CustomButton(
                        isActive: false,
                        title: 'Sign Up',
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyPhonePage(phoneNumber: phoneNumber,)));
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      dividerWithText("or"),
                      buttonWithLeadingLogo('assets/images/apple_logo.png',
                          'Sign In with Apple', Color(0xFF252525)),
                      buttonWithLeadingLogo('assets/images/google_logo.png',
                          'Sign In with Google', Color(0xFF252525)),
                      buttonWithLeadingLogo('assets/images/facebook_logo.png',
                          'Sign In with Facebook', Color(0xFF537BE1)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
