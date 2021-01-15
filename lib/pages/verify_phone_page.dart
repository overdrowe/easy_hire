import 'package:easy_hire/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';

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

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFF4F4F4),
        centerTitle: true,
        title: Text(
          "Verify Phone",
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF252525),
          ),
        ),
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF252525),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
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
            Container(
              child: PinPut(
                fieldsCount: 5,
                onSubmit: (String pin) => _showSnackBar(pin, context),
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.deepPurpleAccent.withOpacity(.5),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
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
              name: "Continue",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
