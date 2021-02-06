import 'dart:ui';

import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2 - 20, size.height-13);
    path.quadraticBezierTo(
        size.width / 2 - 8, size.height - 13, size.width / 2, size.height);
    path.quadraticBezierTo(
        size.width / 2 + 8, size.height - 13, size.width / 2 + 20, size.height-13);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}