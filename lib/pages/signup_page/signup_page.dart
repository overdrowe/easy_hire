import 'package:easy_hire/pages/registration_pages/account_type_selection_page/account_type_selection_page.dart';
import 'package:easy_hire/pages/registration_pages/verify_phone_page/verify_phone_page.dart';
import 'package:easy_hire/services/custom_dialog_alert.dart';
import 'package:easy_hire/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                          color: Color(0xFF252525),
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
                        controller: _phoneController,
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
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (String value) {
                          setState(() {});
                        },
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      CustomButton(
                        isActive: _phoneController.text.isNotEmpty,
                        title: 'Sign Up',
                        onPressed: () => _loginUser(_phoneController.text, context),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      dividerWithText("or"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buttonWithLeadingLogo('assets/images/apple_logo.png',
                                'Log In with Apple', Color(0xFF252525)),
                            buttonWithLeadingLogo('assets/images/google_logo.png',
                                'Log In with Google', Color(0xFF252525)),
                            buttonWithLeadingLogo('assets/images/facebook_logo.png',
                                'Log In with Facebook', Color(0xFF537BE1)),
                          ],
                        ),
                      )
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

  Widget buttonWithLeadingLogo(String imgLink, String title, Color color) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imgLink,
            height: 24.0,
            width: 24.0,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.50),
      ),
      color: color,
      onPressed: () {},
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
              color: Color(0xFF252525),
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

  Future<void> _loginUser(String phone, BuildContext context) async {
    await Firebase.initializeApp();
    FirebaseAuth _auth = FirebaseAuth.instance;
    phone = '+79870413362';

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();
        },
        verificationFailed: (Exception exception){
          print('sorry something went wrong!');
          CustomDialogAlert().showAlert(
            context: context,
            title: 'Ошибка',
            message: 'Введите корректный номер телефона.',
          );
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyPhonePage(
                phoneNumber: phone,
                onTap: (String code) async {
                  AuthCredential credential =
                  PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code.trim());
                  try {
                    await _auth.signInWithCredential(credential);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountTypeSelectionPage()));
                  } catch (e) {
                    CustomDialogAlert().showAlert(
                      context: context,
                      title: 'Ошибка',
                      message: 'Неверный код.',
                    );
                  }
                },
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }

}
