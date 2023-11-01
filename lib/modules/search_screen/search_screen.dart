import 'package:flutter/material.dart';
import 'package:green/layout/cubit/plants_cubit.dart';
import 'package:green/layout/cubit/plants_states.dart';
import 'package:green/models/plant_details_model.dart';
import 'package:green/modules/plant_details_screen/plant_details_screen.dart';
import 'package:green/widgets/content_card.dart';
import 'package:green/widgets/get_started_background.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController searchController = TextEditingController();




    return BlocConsumer<PlantsCubit, PlantsStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#edd8b8"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Center(
              child: Container(
                  width: MediaQuery.of(context).size.width/1.75,
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    cursorColor: HexColor("#0b6837"),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        focusColor: Colors.grey,
                        floatingLabelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2, //<-- SEE HERE
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1, //<-- SEE HERE
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        hintText: "Search...",
                        suffixIcon: IconButton(
                          onPressed: (){
                            print(searchController.text);
                            PlantsCubit.get(context).plantSearch(search: searchController.text);
                          },
                          icon: Icon(Icons.search,
                          ),
                        ),
                        suffixIconColor: Colors.grey

                    ),
                    style: TextStyle(color: HexColor("#0b6837"),fontSize: 15),

                  )
              ),
            ),
          ),

        ],
      ),
      body: Stack(
        children: [
          background(sigmaXBlur: 7.5, sigmaYBlur: 7.5),
          ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=> InkWell(
                onTap:(){
                  showDataAlert(context , PlantsCubit.get(context).searchPlantsList[index]);


                } ,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8,),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height *.08,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.15),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color:  HexColor("#edd8b8"),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                PlantsCubit.get(context).searchPlantsList[index].commonName as String,
                                style: GoogleFonts.autourOne(
                                  textStyle:TextStyle(
                                    fontSize: 30,
                                    color: HexColor("#0b6837"),
                                ),
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width*.95,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Text(
                                    "Other Name: ",
                                    style: GoogleFonts.autourOne(textStyle:TextStyle(
                                        fontSize: 15,
                                        color: Colors.black.withOpacity(.5),
                                    ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width*.65 ,
                                    child: Text(
                                      PlantsCubit.get(context).searchPlantsList[index].scientificName![0] ?? "",
                                      style: GoogleFonts.autourOne(textStyle:TextStyle(
                                          fontSize: 15,
                                          color: Colors.black.withOpacity(.5),
                                      ), ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      textAlign: TextAlign.left,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),
              separatorBuilder:(context,index)=> SizedBox(height: 10),
              itemCount: PlantsCubit.get(context).searchPlantsList.length
          ),
          if(state is PlantsLoadingState)
             Center(
               child: SpinKitWaveSpinner(
                 trackColor: Colors.lightGreenAccent,
                 waveColor: Colors.lightGreenAccent,
                 color: Colors.green,
                 size: 50.0,
               ),
             ),

        ],
      ),
    );
  },
);
  }
}


showDataAlert(BuildContext context , PlantDetailsModel plantModel) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: EdgeInsets.only(
            top: 10.0,
          ),
titlePadding: EdgeInsets.zero,
          backgroundColor: HexColor("#edd8b8"),
          title:Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: Icon(Icons.close),),
            ],
          ),

          content: SingleChildScrollView(
            child:Stack(
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
                                    child:Padding(
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
                                              Icon(
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
                                          SizedBox(height: 10,),
                                          ContentCard(
                                            color: HexColor("#edd8b8"),
                                            widget: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  " ${plantModel!.section![0].type}",
                                                  style: GoogleFonts.autourOne(
                                                    textStyle:  TextStyle(
                                                      fontSize: 35,color: HexColor("#0b6837"),fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  " ${plantModel!.section![0].description}",
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
                                                  " ${plantModel!.section![1].type}",
                                                  style: GoogleFonts.autourOne(
                                                    textStyle:  TextStyle(
                                                      fontSize: 35,color: HexColor("#0b6837"),fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  " ${plantModel!.section![1].description}",
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
                                                  " ${plantModel!.section![2].type}",
                                                  style: GoogleFonts.autourOne(
                                                    textStyle:  TextStyle(
                                                      fontSize: 35,color: HexColor("#0b6837"),fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  " ${plantModel!.section![2].description}",
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
                                    )


                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/6,
                          height: MediaQuery.of(context).size.height / 4,
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
                      height: MediaQuery.of(context).size.height /6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/plants/plant_leaf_5.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: MediaQuery.of(context).size.height /4,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/plants/plant_leaf_6.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      height: MediaQuery.of(context).size.height /3.5,
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
                    Container(
                      width: MediaQuery.of(context).size.width/3.5,
                      height: MediaQuery.of(context).size.height/4,
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
      });
}

