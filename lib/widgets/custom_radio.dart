import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final VoidCallback onTap;

  const CustomRadio({Key key, this.value, this.groupValue, this.onTap}) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(100),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: 28,
          height: 28,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.groupValue == widget.value ? Color(0xFF42B39B) : Colors.white,
              border: Border.all(
                width: 2,
                color:
                widget.groupValue == widget.value ? Color(0xFF42B39B) : Color(0xFFB6B7B8),
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
        onTap: widget.onTap
      );
  }
}
