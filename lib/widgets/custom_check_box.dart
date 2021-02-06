import 'package:easy_hire/app_style/app_style.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final VoidCallback onTap;
  final bool value;

  const CustomCheckBox({Key key, this.onTap, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 24,
          width: 24,
          decoration: value
              ? BoxDecoration(
                  color: AppStyle().mainColor,
                  borderRadius: BorderRadius.circular(4))
              : BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xFFB6B7B8), width: 2),
                  borderRadius: BorderRadius.circular(4)),
          child: value
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Container()),
    );
  }
}
