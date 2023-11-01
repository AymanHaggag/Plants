import 'package:flutter/material.dart';
import 'package:green/models/plant_model.dart';
import 'package:green/modules/plant_details_screen/plant_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';


class PlantCard extends StatelessWidget {
  final PlantModel? plantModel;

  PlantCard({
    @required this.plantModel,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PlantDetailsScreen(plantModel: plantModel)));

      } ,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8,),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: Offset(
                0.0,
                10.0,
              ),
              blurRadius: 10.0,
              spreadRadius: -6.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.15),
              BlendMode.multiply,
            ),
            image: NetworkImage(plantModel!.images?.regularUrl ??  "https://cdn.wallpapersafari.com/23/70/oxZrnP.jpg" ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(
                  plantModel!.commonName as String,
                  style: GoogleFonts.autourOne(textStyle:TextStyle(
                      fontSize: 50,
                      color: Colors.white
                  ), ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
