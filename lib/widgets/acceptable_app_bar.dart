import 'package:easy_hire/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptableAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final VoidCallback onConfirm;

  AcceptableAppBar(
      this.title, {
        Key key, this.onConfirm,
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
            Icons.check,
            color: AppStyle().mainColor,
          ),
          onPressed: onConfirm,
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
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }
}
