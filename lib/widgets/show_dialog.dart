// Flutter imports:
import 'package:flutter/material.dart';

// Packages imports:
import 'package:google_fonts/google_fonts.dart';


// project imports:
import 'package:green/constants/constants.dart';
import 'package:green/models/plant_details.dart';
import 'package:green/widgets/content_card.dart';


showDataAlert(BuildContext context, PlantDetailsModel plantModel) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          titlePadding: EdgeInsets.zero,
          backgroundColor: mainColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    plantModel.commonName as String,
                                    style: GoogleFonts.autourOne(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: secondaryColor),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.water_drop_outlined,
                                                  color: Colors.blue,
                                                ),
                                                Text(
                                                  "Watering : ",
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
                                                const Icon(
                                                  Icons.light_mode_outlined,
                                                  color: Colors.orange,
                                                ),
                                                Text(
                                                  "Sun Light : ",
                                                  style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            AppContentCard(
                                              color: mainColor,
                                              widget: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    " ${plantModel.section![0].type}",
                                                    style:
                                                    GoogleFonts.autourOne(
                                                      textStyle: TextStyle(
                                                        fontSize: 35,
                                                        color:
                                                        secondaryColor,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    " ${plantModel.section![0].description}",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                      const TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            AppContentCard(
                                              color: mainColor,
                                              widget: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    " ${plantModel.section![1].type}",
                                                    style:
                                                    GoogleFonts.autourOne(
                                                      textStyle: TextStyle(
                                                        fontSize: 35,
                                                        color:
                                                        secondaryColor,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    " ${plantModel.section![1].description}",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                      const TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            AppContentCard(
                                              color: mainColor,
                                              widget: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    " ${plantModel.section![2].type}",
                                                    style:
                                                    GoogleFonts.autourOne(
                                                      textStyle: TextStyle(
                                                        fontSize: 35,
                                                        color:
                                                        secondaryColor,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    " ${plantModel.section![2].description}",
                                                    style: GoogleFonts.poppins(
                                                      textStyle:
                                                      const TextStyle(
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                                  7.5,
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                              AssetImage("assets/images/plants/cactus.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 6,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/plants/plant_leaf_5.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/plants/plant_leaf_6.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 3.5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/plants/plant_leaf_7.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.height / 4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/plants/plant_leaf_3.png"),
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
      });
}
