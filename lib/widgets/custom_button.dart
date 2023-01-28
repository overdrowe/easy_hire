import 'package:easy_hire/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isActive;

  const CustomButton({Key key, this.title, this.onPressed, this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      backgroundColor: AppStyle().mainColor,
      disabledBackgroundColor: Color(0xFFB6B7B8),
    );
    return TextButton(
      style: flatButtonStyle,
      child: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.41,
        ),
      ),
      onPressed: isActive ? onPressed : null,
    );
  }
}
