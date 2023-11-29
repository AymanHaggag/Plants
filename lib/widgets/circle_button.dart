import 'package:flutter/material.dart';


class AppCircleButton extends StatelessWidget {
   AppCircleButton({super.key,
    required this.icon,
    required this.onTap,
    this.iconColor
  });

   IconData icon;
   var onTap;
   Color? iconColor;

  @override
  Widget build(BuildContext context) {
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
}
