import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:green/modules/login_screen/login_screen.dart';
import 'package:green/widgets/get_started_background.dart';
import '../../constants/constants.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    navigateToOpeningScreen();
  }

  void navigateToOpeningScreen() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
  }

  TextStyle textStyle = TextStyle(fontSize: 25, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            background(),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1), // Adjust the blur intensity
            child: Container(
              width: double.infinity,
              height: 250,
              color: Colors.black.withOpacity(0.35), // Adjust the color and opacity of the overlay
            ),
          ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      "GREEN",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.lightGreen,
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                          ),
                      ),
                    ),
                    Text(
                      "Plants always make people better, happier, and more helpful; they are sunshine, food and medicine for the soul.",
                      style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white,fontSize: 25)),),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Icon(Icons.circle,color: Colors.orange,),
                        Icon(Icons.circle,color: Colors.white,),
                      ],
                    ),
                    Spacer(),
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
              ),
            )

          ],
        ),
      ),
    );
  }
}
