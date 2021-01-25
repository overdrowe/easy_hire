import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'registration_page.dart';

class VerifyPhonePage extends StatefulWidget {
  final String phoneNumber;

  const VerifyPhonePage({Key key, @required this.phoneNumber})
      : super(key: key);

  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  String phoneNumber;

  @override
  void initState() {
    super.initState();
    phoneNumber = widget.phoneNumber ?? "+1 (603) 555-0123";
  }

  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();

  BoxDecoration _pinPutDecoration(Color color) {
    return BoxDecoration(
      // color: Color(0xFFF4F4F4),
      border: Border(
        bottom: BorderSide(
          width: 1,
          color: color,
        ),
      ),
    );
  }

  Widget get pinPutBackgroundField {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.symmetric(horizontal: 12),
      padding: EdgeInsets.all(8),
      constraints: BoxConstraints(minHeight: 70.0, minWidth: MediaQuery.of(context).size.width/10 + 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("Verify Phone"),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 64),
                child: Text(
                  "Code is sent to $phoneNumber",
                  style: GoogleFonts.montserrat(
                    fontSize: 17,
                    color: Color(0xFF252525),
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pinPutBackgroundField,
                    pinPutBackgroundField,
                    pinPutBackgroundField,
                    pinPutBackgroundField,
                  ],
                ),
                PinPut(
                  eachFieldMargin: EdgeInsets.symmetric(horizontal: 20),
                  eachFieldPadding: EdgeInsets.only(top: 10),
                  eachFieldConstraints:
                      BoxConstraints(minHeight: 64.0, minWidth: MediaQuery.of(context).size.width/10),
                  textStyle: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF252525),
                  ),
                  eachFieldAlignment: AlignmentGeometry.lerp(
                      Alignment.center, Alignment.center, 1),
                  pinAnimationType: PinAnimationType.fade,
                  // mainAxisSize: MainAxisSize.min,
                  fieldsAlignment: MainAxisAlignment.center,
                  fieldsCount: 4,
                  // onSubmit: (String pin) => _showSnackBar(pin, context),
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration:
                      _pinPutDecoration(Color(0xFF252525)),
                  selectedFieldDecoration: _pinPutDecoration(Color(0xFF42B39B)),
                  followingFieldDecoration:
                      _pinPutDecoration(Color(0xFFE9E9E9)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code?",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Color(0xFFB6B7B8),
                    ),
                  ),
                  FlatButton(
                    child: Text(
                      "Request again",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Color(0xFF252525),
                      ),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            CustomButton(
              title: "Continue",
              isActive: false,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrationPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
