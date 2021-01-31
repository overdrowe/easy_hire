import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatefulWidget {
  final Function(String) onChanged;
  final VoidCallback onTap;

  const SearchTextField({Key key, this.onChanged, this.onTap}) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: InkWell(
              onTap: widget.onTap,
              child: Icon(
                Icons.search,
                color: Color(0xFFB6B7B8),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: "Search",
            hintStyle: GoogleFonts.montserrat(color: Color(0xFFB6B7B8)),
            contentPadding: EdgeInsets.all(15),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
            )),
        onChanged: widget.onChanged,
      ),
    );
  }
}
