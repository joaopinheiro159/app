import 'package:flutter/material.dart';

class CustomAppbar extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = 200;
    double width = size.width;
    var path = Path();
    path.lineTo(0, 100);
    path.quadraticBezierTo(width / 2, height - 50, width, 100);
    path.lineTo(width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
