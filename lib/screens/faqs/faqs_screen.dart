//Flutter Imports:
import 'package:flutter/material.dart';

//Packages Imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


//Project Imports:
import '../home/cubit/plants_cubit.dart';
import '../home/cubit/plants_states.dart';
import 'package:green/models/faq.dart';
import 'package:green/constants/constants.dart';
import 'package:green/generated/l10n.dart';


class FAQsScreen extends StatelessWidget {
  const FAQsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<FAQModel> faqs = PlantsCubit.get(context).faqsModelList ;
    return BlocConsumer<PlantsCubit, PlantsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              S.of(context).FAQs,
              style: GoogleFonts.autourOne(textStyle: const TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                ListView.separated(
                    primary: false,
                    // physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                    itemBuilder: (context,index) =>ExpansionTile(
                      iconColor: Colors.green,
                      title: Text(
                        faqs[index].question ?? "Null Question",
                        style: GoogleFonts.autourOne(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),),
                      children: [
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height/3,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(faqs[index].defaultImage?.regularUrl ?? "https://cdn.wallpapersafari.com/23/70/oxZrnP.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            ListTile(title:Text(
                              faqs[index].answer ?? "Null Answer",
                              style: GoogleFonts.autourOne(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),),),
                          ],
                        )


                      ],),
                    separatorBuilder: (context,index) =>const SizedBox(height: 5,),
                    itemCount: faqs.length),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/plants/plant_leaf_1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/6,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/plants/plant_leaf_2.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
