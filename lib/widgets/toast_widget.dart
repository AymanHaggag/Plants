import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


enum ToastStates  {success , error , warning}

Color chooseToastColor (ToastStates state)
{
  Color backGroundColor;

  switch(state){
    case ToastStates.success :
      backGroundColor = Colors.green;
      break;
    case ToastStates.error :
      backGroundColor = Colors.red;
      break;
    case ToastStates.warning :
      backGroundColor = Colors.amberAccent;
      break;
  }
  return backGroundColor;
}

void showToast(String message , ToastStates state ){

  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}