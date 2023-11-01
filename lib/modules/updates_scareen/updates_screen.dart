import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#edd8b8"),
        title: Text("Updates",style: GoogleFonts.autourOne(textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
        ),
      ),
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.security_update_good_rounded,size: 100,color: Colors.grey,),
          Text("You are on the latest version"),
        ],
      ),),
    );
  }
}
