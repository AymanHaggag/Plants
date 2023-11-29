// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:green/generated/l10n.dart';
import 'package:green/models/saved_plant.dart';

// Project imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:green/widgets/loading_indecator.dart';
import '../../constants/constants.dart';
import '../home/cubit/plants_cubit.dart';
import '../home/cubit/plants_states.dart';


class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlantsCubit.get(context).getSavedPlants(uId: uId!);
    return BlocConsumer<PlantsCubit, PlantsStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    List<SavedPlantModel> savedPlantsList =  PlantsCubit.get(context).savedPlantsList;
    return BlocConsumer<PlantsCubit, PlantsStates>(
  listener: (context, state) {
    // TODO: implement listener

  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(S.of(context).saved,style: GoogleFonts.autourOne(textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
        child: ConditionalBuilder(
            condition: savedPlantsList.isEmpty,
            builder: (context)=> Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.data_saver_off),
                  Text(S.of(context).discoverMorePlants)
                ],
              ),
            ),
            fallback: (context)=> ConditionalBuilder(
              condition: state is PlantsLoadingState,
              builder: (context) =>const Center(
                child: AppLoadingIndicator()
              ),
              fallback: (context) => ListView.separated(
                itemBuilder: (context,index)=> InkWell(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8,),
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.height * .20,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: const Offset(
                              0.0,
                              10.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: -6.0,
                          ),
                        ],
                      ),
                      child:Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.6),
                                  offset: const Offset(
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
                                image: NetworkImage(savedPlantsList[index].image ??  "https://cdn.wallpapersafari.com/23/70/oxZrnP.jpg" ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  " ${savedPlantsList[index].commonName}",
                                  style: GoogleFonts.autourOne(
                                    textStyle:  TextStyle(
                                        fontSize: 35,color: secondaryColor,fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis
                                    ),

                                  ),
                                ),
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                children: [
                                  const SizedBox(width: 12,),
                                  const Icon(
                                    Icons.water_drop_outlined,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "Watering : ${savedPlantsList[index].wateringShort}",
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
                                  const SizedBox(width: 12,),
                                  const Icon(
                                    Icons.light_mode_outlined,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    "Sun Light : ${savedPlantsList[index].sunLightShort}",
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                            ],
                          )



                        ],
                      ) ),
                  onTap: (){


                                  },
                ),
                separatorBuilder:(context,index)=> const SizedBox(height: 10),
                itemCount: PlantsCubit.get(context).savedPlantsList.length,
              ),
            ),


        ),
      ),
    );
  },
);
  },
);
  }
}


/*
class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('showDialog Sample')),
      body: Center(
        child: OutlinedButton(
          onPressed: () => _dialogBuilder(context),
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'provide critical information, or prompt\n'
                'for a decision to be made.',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}*/
