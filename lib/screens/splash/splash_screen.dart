// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Packages imports:
import 'package:google_fonts/google_fonts.dart';

// project imports:
import 'package:green/widgets/background.dart';
import '../sign_in/sign_in_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToOpeningScreen();
  }

  void navigateToOpeningScreen() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {}).then((value) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    } );
  }

  TextStyle textStyle = const TextStyle(fontSize: 25, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AppBackground(),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Adjust the blur intensity
            child: Container(
              width: double.infinity,
              height: 250,
              color: Colors.black.withOpacity(0.35), // Adjust the color and opacity of the overlay
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "GREEN",
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
                  Text(
                    "Plants always make people better, happier, and more helpful; they are sunshine, food and medicine for the soul.",
                    style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white,fontSize: 25)),),
                  const Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.circle,color: Colors.orange,),
                      Icon(Icons.circle,color: Colors.white,),
                    ],
                  ),
                  const Spacer(),
                  Center(
                    child: Text(
                      "Powered by Ayman Haggag©",
                      style: GoogleFonts.poppins(
                          textStyle : TextStyle(
                            color: Colors.grey.shade200

                    )),),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
