import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({super.key});


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BirthDayCardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    double sideRadius = 20;
    double midPoint = size.height * (3/5);
    double cornerRadius = 20.0;

    path.moveTo(0, cornerRadius);
    path.lineTo(0, (midPoint - sideRadius));

    //LEFT ARC
    path.quadraticBezierTo(
        sideRadius, midPoint - sideRadius,
        sideRadius, midPoint
    );
    path.quadraticBezierTo(
        sideRadius, midPoint + sideRadius,
        0, midPoint + sideRadius
    );

    path.lineTo(0, size.height - cornerRadius);

    //BottomLeft
    path.quadraticBezierTo(
        0, size.height,
        cornerRadius, size.height
    );

    path.lineTo(size.width - cornerRadius, size.height);

    //BottomRight
    path.quadraticBezierTo(
        size.width, size.height,
        size.width, size.height - cornerRadius
    );

    path.lineTo(size.width, (midPoint + sideRadius));

    //RIGHT ARC
    path.quadraticBezierTo(
        (size.width*2 - sideRadius*4), (midPoint*2 + sideRadius*4),
        (size.width*2 - sideRadius*4), (midPoint*2)
    );
    path.quadraticBezierTo(
        (size.width*2 - sideRadius*4), (midPoint*2 - sideRadius*4),
        size.width*2, midPoint*2 - sideRadius*4
    );

    path.lineTo(size.width*2, cornerRadius*4);

    //TopRight
    path.quadraticBezierTo(
        size.width, 0,
        size.width - cornerRadius, 0
    );

    path.lineTo(cornerRadius, 0);

    //TopLeft
    path.quadraticBezierTo(
        0, 0,
        0, cornerRadius
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
