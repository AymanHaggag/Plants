// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:green/widgets/elevated_button.dart';
import 'package:green/widgets/background.dart';
import '../sign_in/sign_in_screen.dart';
import '../sign_up/sign_up_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          AppBackground(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Spacer(),
                Row(
                  children: [
                    Text(
                      "Welcome to ",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "GREEN!",
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                              fontSize: 39,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Text(
                  "Where every seed begins a new story. Let's grow together!",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(fontSize: 35, color: Colors.white)),
                ),
                AppButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  widget: Text("Join Now"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have Account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false);
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  "© 2022-2023 Perenual.com All Rights Reserved",
                  style: GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.white38)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
