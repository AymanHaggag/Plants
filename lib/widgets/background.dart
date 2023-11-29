import 'dart:ui';

import 'package:flutter/material.dart';


class AppBackground extends StatelessWidget {
   AppBackground({super.key,
   this.sigmaXBlur =0,
   this.sigmaYBlur =0,
   });

  double sigmaXBlur;
  double sigmaYBlur;

  @override
  Widget build(BuildContext context) {
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
}

