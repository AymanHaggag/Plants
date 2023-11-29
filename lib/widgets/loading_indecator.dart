import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWaveSpinner(
        trackColor: Colors.lightGreenAccent,
        waveColor: Colors.lightGreenAccent,
        color: Colors.green,
        size: 50.0,
      ),
    );
  }
}


