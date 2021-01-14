import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
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
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: "Password",
                            contentPadding: EdgeInsets.all(15),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      FlatButton(
                        child: Text(
                          'Log In',
                          style: GoogleFonts.montserrat(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.41,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: const EdgeInsets.all(15),
                        color: Colors.grey,
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
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
                              "or",
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
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/apple_logo.png',
                              color: Colors.white,
                              height: 24.0,
                              width: 24.0,
                            ),
                            Text(
                              'Log In with Apple',
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
                        color: Color(0xFF252525),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/apple_logo.png',
                              color: Colors.white,
                              height: 24.0,
                              width: 24.0,
                            ),
                            Text(
                              'Log In with Google',
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
                        color: Color(0xFF252525),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/apple_logo.png',
                              color: Colors.white,
                              height: 24.0,
                              width: 24.0,
                            ),
                            Text(
                              'Log In with Facebook',
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
                        color: Color(0xFF537BE1),
                        onPressed: () {},
                      ),
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
