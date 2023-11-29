//Flutter Imports:
import 'package:flutter/material.dart';

//Packages Imports:
import 'package:shimmer/shimmer.dart';
import 'package:hexcolor/hexcolor.dart';


class AppShimmer extends StatelessWidget {
   AppShimmer({
     super.key,
     required this.widget
   });

   Widget widget;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: HexColor("#d3c4aa"),
      highlightColor: HexColor("#e3dcd2"),
      child: widget,
    );
  }
}
