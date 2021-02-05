import 'package:easy_hire/app_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularCheckBox extends StatefulWidget {

  final VoidCallback onTap;
  final bool isActive;
  final bool boldTitle;
  final String title;

  const CircularCheckBox({Key key, this.onTap, this.title, this.isActive, this.boldTitle})
      : super(key: key);

  @override
  _CircularCheckBoxState createState() => _CircularCheckBoxState();
}

class _CircularCheckBoxState extends State<CircularCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title,
              style: GoogleFonts.montserrat(
                fontSize: 17,
                fontWeight: widget.boldTitle ? FontWeight.bold : FontWeight.normal,
                color: Color(0xFF252525),
              )),
          InkWell(
              borderRadius: BorderRadius.circular(100),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.isActive
                        ? AppStyle().mainColor
                        : Colors.white,
                    border: Border.all(
                      width: 2,
                      color: widget.isActive
                          ? AppStyle().mainColor
                          : Color(0xFFB6B7B8),
                    )),
                child: Center(
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: widget.onTap)
        ],
      ),
    );
  }
}
