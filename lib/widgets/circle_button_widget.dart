import 'package:flutter/material.dart';

Widget circleButton({
  required IconData icon,
  required var onTap,
  Color? iconColor
}) {
  return SizedBox.fromSize(
    size: Size(45, 46),
    child: ClipOval(
      child: Material(
        color: Colors.greenAccent,
        child: InkWell(
          splashColor: Colors.green,
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: iconColor,
                size: 40,
              ),
              // <-- Icon
            ],
          ),
        ),
      ),
    ),
  );
}
