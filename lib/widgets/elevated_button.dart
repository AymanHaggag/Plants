import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
   AppButton({
    super.key,
    required this.onPressed,
    required this.widget,
    this.icon,
  });

   var onPressed;
   Widget widget;
   IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.greenAccent,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: onPressed
          ,
          child: widget),
    );
  }
}