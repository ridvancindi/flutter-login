import 'package:flutter/material.dart';

class CustomWidgets {
  static Widget socialButtonRect(title, color, icon, {Function? onTap}) {
    Color facebookColor = const Color(0xff39579A);
    Color googleColor = const Color(0xffDF4A32);
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            color: title == "Facebook" ? facebookColor : googleColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(
                icon,
                color: Colors.white,
                size: 17,
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: title == "Facebook" ? 8 : 15, right: 20),
              child: Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }

  static Widget socialButtonCircle(color, icon, {iconColor, Function? onTap}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Icon(
            icon,
            color: iconColor,
          )), //
    );
  }
}
