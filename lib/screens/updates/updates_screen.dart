//Flutter Imports:
import 'package:flutter/material.dart';

//Packages Imports:
import 'package:google_fonts/google_fonts.dart';

//Project Imports:
import 'package:green/constants/constants.dart';
import 'package:green/generated/l10n.dart';


class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(S.of(context).updates,style: GoogleFonts.autourOne(textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        ),
      ),
      body:  Center(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.security_update_good_rounded,size: 100,color: Colors.grey,),
          Text(S.of(context).youAreOnLatestVersion),
        ],
      ),),
    );
  }
}
