import 'package:flutter/material.dart';

Widget DefaultElevatedButton({
  required var onPressed,
  required String text,
  IconData? icon,
}) {
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(icon != null)
             Icon(icon),
             SizedBox(width: 8,),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        )),
  );
}
