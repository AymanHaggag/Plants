//Flutter Imports:
import 'package:flutter/material.dart';

//Packages Imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

//Project Imports:
import 'package:green/constants/constants.dart';
import 'package:green/generated/l10n.dart';
import 'package:green/models/plant.dart';
import 'package:green/models/plant_details.dart';
import 'package:green/widgets/content_card.dart';
import 'package:green/widgets/loading_indecator.dart';
import 'package:green/widgets/stack_wave.dart';
import 'package:green/widgets/toast.dart';
import '../home/cubit/plants_cubit.dart';
import '../home/cubit/plants_states.dart';


class PlantDetailsScreen extends StatelessWidget {
  PlantModel? plantModel;

  PlantDetailsScreen({super.key,
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
      listener: (context, state) {
        {
          if(state is PlantsGetSavedPlantsSuccessfulState){
            showToast("Plant saved", ToastStates.success);
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              S.of(context).plantsDetails,
              style: GoogleFonts.autourOne(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  PlantsCubit.get(context).savePlant(
                      id: plantModel!.id,
                      commonName: plantModel!.commonName,
                      image: plantModel!.images!.originalUrl,
                      wateringShort: plantModel!.watering,
                      sunLightShort: plantModel!.sunlight![0],
                      watering: plantDetails!.section![0].type ?? "null",
                      wateringDescription:
                          plantDetails!.section![0].description ?? "null",
                      sunLight: plantDetails!.section![1].type ?? "null",
                      sunLightDescription:
                          plantDetails!.section![1].description ?? "null",
                      pruning: plantDetails!.section![2].type ?? "null",
                      pruningDescription:
                          plantDetails!.section![2].description ?? "null");
                },
                icon: const Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
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
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(plantModel!
                                              .images?.originalUrl ??
                                          "https://cdn.wallpapersafari.com/23/70/oxZrnP.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const AppStackedWaves(),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 346.5,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.only(
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
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 15,left: 15),
                                          child: Text(
                                            plantModel!.commonName as String,
                                            style: GoogleFonts.autourOne(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,
                                                  color: textColor),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ConditionalBuilder(
                                            condition: state
                                                is PlantsGetPlantDataLoadingState,
                                            builder: (context) => Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            4.5,
                                                      ),
                                                      const AppLoadingIndicator(),
                                                    ]),
                                            fallback: (context) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .water_drop_outlined,
                                                            color: Colors.blue,
                                                          ),
                                                          Text(
                                                            "Watering : ${plantModel!.watering}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  const TextStyle(
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          const Icon(
                                                            Icons
                                                                .light_mode_outlined,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                          Text(
                                                            "Sun Light : ${plantModel!.sunlight}",
                                                            style: GoogleFonts
                                                                .poppins(
                                                              textStyle:
                                                                  const TextStyle(
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
                                                        color:
                                                            mainColor,
                                                        widget: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              " ${plantDetails!.section![0].type}",
                                                              style: GoogleFonts
                                                                  .autourOne(
                                                                textStyle:
                                                                    TextStyle(
                                                                  fontSize: 35,
                                                                  color: textColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              " ${plantDetails!.section![0].description}",
                                                              style: GoogleFonts
                                                                  .poppins(
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
                                                        color:
                                                            mainColor,
                                                        widget: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              " ${plantDetails!.section![1].type}",
                                                              style: GoogleFonts
                                                                  .autourOne(
                                                                textStyle:
                                                                    TextStyle(
                                                                  fontSize: 35,
                                                                  color: textColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              " ${plantDetails!.section![1].description}",
                                                              style: GoogleFonts
                                                                  .poppins(
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
                                                        color:
                                                            mainColor,
                                                        widget: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              " ${plantDetails!.section![2].type}",
                                                              style: GoogleFonts
                                                                  .autourOne(
                                                                textStyle:
                                                                    TextStyle(
                                                                  fontSize: 35,
                                                                  color: textColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                            Text(
                                                              " ${plantDetails!.section![2].description}",
                                                              style: GoogleFonts
                                                                  .poppins(
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
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            7.5,
                                                      )
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
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height / 2.5,
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
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/plants/plant_leaf_5.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              "assets/images/plants/plant_leaf_6.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 2.5,
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
                    const SizedBox(
                      height: 300,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: MediaQuery.of(context).size.height / 3,
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
      },
    );
  }
}


