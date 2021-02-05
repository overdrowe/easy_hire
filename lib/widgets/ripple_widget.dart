import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RippleWidget extends StatelessWidget {

  final VoidCallback onTap;

  const RippleWidget({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(20),
              onTap: onTap,
            )));
  }
}
