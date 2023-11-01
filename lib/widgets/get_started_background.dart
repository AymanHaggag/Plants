import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget background(
{
  double sigmaXBlur =0,
  double sigmaYBlur = 0,
}
    ){
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(32),
    decoration: BoxDecoration(
        image:  DecorationImage(
            image: AssetImage("assets/images/get_starte_2.jpg"),
            fit: BoxFit.cover)
    ),
      child:   BackdropFilter(
      filter:  ImageFilter.blur( sigmaX: sigmaXBlur, sigmaY: sigmaYBlur) ,
      child:  Container(
        decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
      ),
    ),
  );
}