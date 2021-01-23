import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;
  final bool isActive;

  const CustomButton({Key key, this.title, this.onPressed, this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 17,
          color: isActive ? Color(0xFF252525) : Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.41,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: isActive ? Color(0xFF42B39B) : Color(0xFFB6B7B8),
      onPressed: onPressed,
    );
  }
}
