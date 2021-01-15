import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {

  final String name;
  final VoidCallback onPressed;

  const CustomButton({Key key, this.name, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        name,
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
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Color(0xFFB6B7B8),
      onPressed: onPressed,
    );
  }
}
