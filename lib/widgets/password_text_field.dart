import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final bool unVisible;
  final VoidCallback onTap;

  const PasswordTextField({Key key, this.hintText, this.unVisible, this.onTap}) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return passwordTextFieldStyle(widget.hintText, widget.unVisible, widget.onTap);
  }



  Widget passwordTextFieldStyle(String hintText, bool unVisible, VoidCallback onTap) {
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
              onTap: onTap
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
}
