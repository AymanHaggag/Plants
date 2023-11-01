import 'dart:math';

import 'package:flutter/material.dart';
import 'package:green/layout/cubit/plants_cubit.dart';
import 'package:green/layout/cubit/plants_states.dart';
import 'package:green/models/plant_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/modules/get_started_screen/get_started_screen.dart';
import 'package:green/models/plant_details_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:green/test_screen.dart';
import 'package:green/widgets/content_card.dart';
import 'package:green/widgets/plant_card.dart';
import 'package:green/widgets/shimmer_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';


class PlantDetailsScreen extends StatelessWidget {
  PlantModel? plantModel;


  PlantDetailsScreen({Key? key,
    this.plantModel,
  });

  @override
  Widget build(BuildContext context) {
    PlantDetailsModel? plantDetails;

    PlantsCubit.get(context)
        .getPlantData(plantId: plantModel!.id as int)
        .then((value) {
      plantDetails = PlantsCubit.get(context).plantDetails!;
    });

    return BlocConsumer<PlantsCubit, PlantsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor("#edd8b8"),
            title: Text("Plant Details",
              style: GoogleFonts.autourOne(textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    PlantsCubit.get(context).savePlant(
                        id: plantModel!.id,
                        commonName: plantModel!.commonName,
                        image: plantModel!.images!.originalUrl,
                        wateringShort: plantModel!.watering,
                        sunLightShort: plantModel!.sunlight![0],
                        watering: plantDetails!.section![0].type ??  "null",
                        wateringDescription: plantDetails!.section![0].description ??  "null",
                        sunLight: plantDetails!.section![1].type ??  "null" ,
                        sunLightDescription: plantDetails!.section![1].description ??  "null",
                        pruning: plantDetails!.section![2].type ??  "null",
                        pruningDescription: plantDetails!.section![2].description ??  "null"
                    );
                  },
                  icon: Icon(Icons.bookmark_border_outlined,color: Colors.grey,size: 35,),),
            ],
          ),
          body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Stack(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height / 2.5,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(plantModel!.images?.originalUrl ??
                                        "https://cdn.wallpapersafari.com/23/70/oxZrnP.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                            ],
                          ),
                          StackedWaves(),
                          Column(
                            children: [
                              const SizedBox(
                                height: 346.5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                //Height Need to be changed
                                height: MediaQuery.of(context).size.height,
                                decoration:  BoxDecoration(
                                  color: HexColor("#F6ecdd"),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Page Content
                          Column(
                            children: [
                              const SizedBox(
                                height: 285,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      plantModel!.commonName as String,
                                      style: GoogleFonts.autourOne(
                                        textStyle:  TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: HexColor("#0b6837")),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child:
                                        ConditionalBuilder(
                                            condition: state is PlantsGetPlantDataLoadingState,
                                            builder: (context) =>Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children:[
                                                SizedBox(height: MediaQuery.of(context).size.height/4.5,),
                                                SpinKitWaveSpinner(
                                                  trackColor: Colors.lightGreenAccent,
                                                  waveColor: Colors.lightGreenAccent,
                                                  color: Colors.green,
                                                  size: 50.0,
                                                ),
                                              ]
                                            ),
                                            fallback: (context) => Padding(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 12
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.water_drop_outlined,
                                                        color: Colors.blue,
                                                      ),
                                                      Text(
                                                        "Watering : ${plantModel!.watering}",
                                                        style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.light_mode_outlined,
                                                        color: Colors.orange,
                                                      ),
                                                      Text(
                                                        "Sun Light : ${plantModel!.sunlight}",
                                                        style: GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  ContentCard(
                                                    color: HexColor("#edd8b8"),
                                                    widget: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          " ${plantDetails!.section![0].type}",
                                                          style: GoogleFonts.autourOne(
                                                            textStyle:  TextStyle(
                                                              fontSize: 35,color: HexColor("#0b6837"),fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          " ${plantDetails!.section![0].description}",
                                                          style: GoogleFonts.poppins(
                                                            textStyle: const TextStyle(
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  ContentCard(
                                                    color: HexColor("#edd8b8"),
                                                    widget: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,

                                                      children: [
                                                        Text(
                                                          " ${plantDetails!.section![1].type}",
                                                          style: GoogleFonts.autourOne(
                                                            textStyle:  TextStyle(
                                                              fontSize: 35,color: HexColor("#0b6837"),fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          " ${plantDetails!.section![1].description}",
                                                          style: GoogleFonts.poppins(
                                                            textStyle: const TextStyle(
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  ContentCard(
                                                    color: HexColor("#edd8b8"),
                                                    widget: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          " ${plantDetails!.section![2].type}",
                                                          style: GoogleFonts.autourOne(
                                                            textStyle:  TextStyle(
                                                              fontSize: 35,color: HexColor("#0b6837"),fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          " ${plantDetails!.section![2].description}",
                                                          style: GoogleFonts.poppins(
                                                            textStyle: const TextStyle(
                                                              fontSize: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(height: MediaQuery.of(context).size.height/7.5,)
                                                ],
                                              ),
                                            )),


                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),


                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/4,
                        height: MediaQuery.of(context).size.height / 2.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/plants/cactus.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height /5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/plants/plant_leaf_5.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.height /3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/plants/plant_leaf_6.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    height: MediaQuery.of(context).size.height /2.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/plants/plant_leaf_7.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 300,),
                  Container(
                    width: MediaQuery.of(context).size.width/2.5,
                    height: MediaQuery.of(context).size.height/3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/plants/plant_leaf_3.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
        );
      },
    );
  }
}

class StackedWaves extends StatelessWidget {
  const StackedWaves({Key? key}) : super(key: key);

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
      ..shader = LinearGradient(colors: [
        Colors.green,
        Colors.lightGreenAccent,
      ]).createShader(Offset.zero & size);
    final double side = 50;
    final double radius = 50;

    final path = Path()
      ..moveTo(0, size.height / 2 + side)
      ..arcToPoint(Offset(side, size.height / 2),
          radius: Radius.circular(radius))
      ..lineTo(size.width - side, size.height / 2)
      ..arcToPoint(Offset(size.width, size.height / 2 - side),
          radius: Radius.circular(radius), clockwise: false)
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
