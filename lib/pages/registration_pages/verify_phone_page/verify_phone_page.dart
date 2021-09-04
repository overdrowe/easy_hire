import 'dart:async';

import 'package:easy_hire/app_style/app_style.dart';
import 'package:easy_hire/widgets/custom_app_bar.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyPhonePage extends StatefulWidget {
  final String phoneNumber;
  final Function(String) onTap;

  const VerifyPhonePage({
    @required this.phoneNumber,
    @required this.onTap,
  });

  @override
  _VerifyPhonePageState createState() => _VerifyPhonePageState();
}

class _VerifyPhonePageState extends State<VerifyPhonePage> {
  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();
  final int _pinCodeLength = 6;

  Timer _timer;
  int _secondsLeft = 60;
  String _phoneNumber;


  @override
  void initState() {
    super.initState();
    _phoneNumber = widget.phoneNumber ?? "+1 (603) 555-0123";
    _timer = Timer.periodic(
      Duration(milliseconds: 1000),
      (Timer timer) {
        setState(() {
          _secondsLeft--;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
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
                  "Code is sent to $_phoneNumber",
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
                    pinPutBackgroundField,
                    pinPutBackgroundField,
                  ],
                ),
                PinPut(
                  eachFieldMargin: EdgeInsets.symmetric(horizontal: 8),
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
                  fieldsAlignment: MainAxisAlignment.center,
                  fieldsCount: _pinCodeLength,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration:
                  _pinPutDecoration(Color(0xFF252525)),
                  selectedFieldDecoration: _pinPutDecoration(AppStyle().mainColor),
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
                  TextButton(
                    child: Text(
                      _secondsLeft > 0
                        ? "Request again ($_secondsLeft)"
                        : "Request again",
                      style: GoogleFonts.montserrat(
                        fontSize: 15,
                        color: Color(0xFF252525),
                      ),
                    ),
                    onPressed: _secondsLeft > 0
                      ? null
                      : () {},
                  )
                ],
              ),
            ),
            CustomButton(
              title: "Continue",
              isActive: _pinPutController.text.length == _pinCodeLength,
              onPressed: () async {
                await widget.onTap(_pinPutController.text);
                setState(() {
                  _pinPutController.clear();
                });
              },
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _pinPutDecoration(Color color) {
    return BoxDecoration(
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
      margin: EdgeInsets.symmetric(horizontal: 4),
      padding: EdgeInsets.all(8),
      constraints: BoxConstraints(minHeight: 70.0, minWidth: MediaQuery.of(context).size.width/10 + 8),
    );
  }
}
