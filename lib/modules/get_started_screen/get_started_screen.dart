import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/modules/login_screen/login_screen.dart';
import 'package:green/modules/sign_up_screen/sign_up_screen.dart';
import 'package:green/widgets/elevated_button_widget.dart';
import 'package:green/widgets/get_started_background.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          background(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Row(
                  children: [
                    Text(
                      "Welcome to ",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      "GREEN!",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 39,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Text(
                  "Where every seed begins a new story. Let's grow together!",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 35, color: Colors.white)),
                ),
                DefaultElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  text: "Join Now",
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
                Spacer(),
                Text("© 2022-2023 GREEN. All Rights Reserved",style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white38)),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
