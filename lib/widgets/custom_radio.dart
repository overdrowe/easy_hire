import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final VoidCallback onTap;
  final String title;

  const CustomRadio({Key key, this.value, this.groupValue, this.onTap, this.title})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title,
            style: GoogleFonts.montserrat(
              fontSize: 17,
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
                  color: widget.groupValue == widget.value
                      ? Color(0xFF42B39B)
                      : Colors.white,
                  border: Border.all(
                    width: 2,
                    color: widget.groupValue == widget.value
                        ? Color(0xFF42B39B)
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
    );
  }
}
