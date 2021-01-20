import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  CustomAppBar(
    this.title, {
    Key key,
  })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: FlatButton(
        child: Icon(
          Icons.arrow_back_ios,
          color: Color(0xFF252525),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.close,
            color: Color(0xFF252525),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
      elevation: 0,
      title: Text(
        title,
        style: GoogleFonts.montserrat(
          fontSize: 22,
          letterSpacing: 0.38,
          fontWeight: FontWeight.bold,
          color: Color(0xFF252525),
        ),
      ),
      backgroundColor: Color(0xFFF4F4F4),
      centerTitle: true,
    );
  }
}
