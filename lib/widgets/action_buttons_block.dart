import 'package:easy_hire/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButtonsBlock extends StatefulWidget {
  final Color secondColor;

  const ActionButtonsBlock({Key key, this.secondColor = Colors.white}) : super(key: key);

  @override
  _ActionButtonsBlockState createState() => _ActionButtonsBlockState();
}

class _ActionButtonsBlockState extends State<ActionButtonsBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          btnItem(title: "hire", color: AppStyle().mainColor, onTap: () {}),
          btnItem(title: "block", color: widget.secondColor, onTap: () {}),
          btnItem(title: "deny", color: widget.secondColor, onTap: () {}),
        ],
      ),
    );
  }

  btnItem({String title, VoidCallback onTap, Color color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  color: color != Colors.white ? Colors.white : Color(0xFF252525),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
