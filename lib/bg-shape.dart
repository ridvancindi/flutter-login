    import 'package:flutter/material.dart';

    class MyClipper extends CustomClipper<Path> {
      @override
      Path getClip(Size size) {
        var path = Path();
        path.lineTo(0, 480);/*220*/
        path.quadraticBezierTo(
            size.width / 4, 420 /*180*/, size.width / 2, 435);
        path.quadraticBezierTo(
            3 / 4 * size.width, 450, size.width, 390);
        path.lineTo(size.width, 0);
        path.close();
        return path;
      }

      @override
      bool shouldReclip(CustomClipper<Path> oldClipper) {
        return false;
      }
    }