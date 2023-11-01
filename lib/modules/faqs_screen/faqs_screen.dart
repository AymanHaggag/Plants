import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/layout/cubit/plants_cubit.dart';
import 'package:green/layout/cubit/plants_states.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/models/faq_model.dart';
import 'package:hexcolor/hexcolor.dart';




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
            backgroundColor: HexColor("#edd8b8"),
            // leading: IconButton(onPressed: (){},icon: Icon(Icons.view_headline_outlined),
            // ),
            title: Text("FAQs",style: GoogleFonts.autourOne(textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                          textStyle: TextStyle(
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
                                textStyle: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),),),
                          ],
                        )


                      ],),
                    separatorBuilder: (context,index) =>SizedBox(height: 5,),
                    itemCount: faqs.length),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/plants/plant_leaf_1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/6,
                  decoration: BoxDecoration(
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
