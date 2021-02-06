import 'package:easy_hire/pages/started_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final VoidCallback onTap;
  final bool automaticallyImplyActions;

  CustomAppBar(
    this.title, {
    this.onTap,
    Key key,
    this.automaticallyImplyActions = true,
  })  : preferredSize = Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: FlatButton(
        child: Icon(
          Icons.arrow_back_ios_outlined,
          color: Color(0xFF252525),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        automaticallyImplyActions
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  color: Color(0xFF252525),
                ),
                onPressed: onTap ?? () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => StartedPage()),
                      (Route<dynamic> route) => false);
                },
              )
            : Container()
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
