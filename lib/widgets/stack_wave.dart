//Flutter Imports:
import 'package:flutter/material.dart';

//Packages Imports:
import 'package:hexcolor/hexcolor.dart';


class AppStackedWaves extends StatelessWidget {
  const AppStackedWaves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 1.45),
      painter: StackedWavesPainter(),
    );
  }
}

class StackedWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(colors: [
        Colors.green,
        Colors.lightGreenAccent,
      ]).createShader(Offset.zero & size);
    const double side = 50;
    const double radius = 50;

    final path = Path()
      ..moveTo(0, size.height / 2 + side)
      ..arcToPoint(Offset(side, size.height / 2),
          radius: const Radius.circular(radius))
      ..lineTo(size.width - side, size.height / 2)
      ..arcToPoint(Offset(size.width, size.height / 2 - side),
          radius: const Radius.circular(radius), clockwise: false)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.save();
    canvas.drawPath(path, paint);
    canvas.restore();

    canvas.save();
    canvas.translate(0, 60);
    canvas.drawPath(path, Paint()..color = HexColor("#F6ecdd"));
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}