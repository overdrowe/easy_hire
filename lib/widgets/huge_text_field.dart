import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HugeTextField extends StatefulWidget {

  final String hintText;
  final String text;
  final Function(String) onChanged;

  const HugeTextField({Key key, this.hintText, this.onChanged, this.text}) : super(key: key);

  @override
  _HugeTextFieldState createState() => _HugeTextFieldState();
}

class _HugeTextFieldState extends State<HugeTextField> {
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 12),
          child: TextField(
            onChanged: widget.onChanged,
            maxLength: 500,
            minLines: 10,
            maxLines: null,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: widget.hintText,
                hintStyle: GoogleFonts.montserrat(
                    color: Color(0xFFB6B7B8), fontSize: 16),
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
        ),
        // Positioned(
        //     right: 16,
        //     bottom: 16,
        //     child: Text(
        //       widget.text.length.toString() + "/500",
        //       style: GoogleFonts.montserrat(
        //           fontSize: 12, color: Color(0xFFB6B7B8)),
        //     ))
      ],
    );

  }
}
