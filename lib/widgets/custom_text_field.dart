import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {

  final String hintText;
  final Function(String) onChanged;

  const CustomTextField({Key key, this.hintText, this.onChanged}) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.only(bottom: 12),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFF4F4F4),
              hintText: widget.hintText,
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
          onChanged: widget.onChanged,
        ),
      );

  }
}
