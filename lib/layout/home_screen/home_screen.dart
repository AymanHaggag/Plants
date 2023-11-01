import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/layout/cubit/plants_cubit.dart';
import 'package:green/layout/cubit/plants_states.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:green/modules/chat_pot_screen/chat_pot_screen.dart';
import 'package:green/modules/faqs_screen/faqs_screen.dart';
import 'package:green/modules/login_screen/cubit/user_cubit.dart';
import 'package:green/modules/login_screen/login_screen.dart';
import 'package:green/modules/saved_screen/saved_screen.dart';
import 'package:green/modules/search_screen/search_screen.dart';
import 'package:green/modules/updates_scareen/updates_screen.dart';
import 'package:green/tools/local_storage_tool/cashe_helper.dart';
import 'package:green/widgets/text_form_field_widget.dart';
import 'package:green/widgets/toast_widget.dart';
import 'package:hexcolor/hexcolor.dart';


import 'package:green/widgets/get_started_background.dart';
import 'package:green/widgets/plant_card.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  final TextEditingController searchController = TextEditingController();
  final TextEditingController confirmDeletePasswordController = TextEditingController();
  final TextEditingController confirmDeleteEmailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantsCubit, PlantsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            drawer: NavigationDrawer(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(.7),
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top,
                ),
                const Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      CircleAvatar(
                        radius: 78,
                        backgroundColor:Colors.green,
                        child: CircleAvatar(
                          radius: 75,
                          backgroundImage: AssetImage("assets/images/user_avatar/couple_Avatar.jpg",),

                        ),
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("Hello Ayman!",style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 25)),)),
                ),
                ListTile(
                  leading: const Icon(Icons.home,size: 30,),
                  title: Text("Home",
                    style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)) ,),
                  onTap: (){
                    Navigator.of(context).pop();

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.bookmark_border_outlined,size: 30,),
                  title: Text("Saved",
                    style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)) ,),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const SavedScreen()));

                  },
                ),
                ListTile(
                  leading: const Icon(Icons.update,size: 30,),
                  title: Text("Updates",
                    style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)) ,),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UpdatesScreen()));


                  },
                ),
                ListTile(
                  leading: const Icon(Icons.question_mark_outlined,size: 30,),
                  title: Text("FAQs",
                    style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)) ,),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FAQsScreen()));


                  },
                ),
                const Divider(color: Colors.grey,),
                ExpansionTile(
                    title: Text("Account",
                  style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)) ,),
                iconColor: Colors.green,
                  textColor: Colors.green,
                children: [
                  ListTile(
                    leading: const Icon(Icons.logout,size: 30,),
                    title: Text("Log Out",
                      style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)) ,),
                    onTap: (){
                      CacheHelper.deleteData(key: "uId").then((value) {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                            builder: (context) => LoginScreen()
                        ), (route) => false);
                        showToast("logout successful", ToastStates.success);
                      });

                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.delete_forever_outlined,size: 30,),
                    title: Text("Delete Account",
                      style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)) ,),
                    onTap: (){
                      showDialog(context: context, builder:(context)=>
                      AlertDialog(
                        backgroundColor: HexColor("#edd8b8"),
                      title: Text("Are you sure you want to delete your account?",
                        style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)) ,),
                      content: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style : ElevatedButton.styleFrom(primary:  HexColor("#0b6837")) ,

                                onPressed: (){
                              Navigator.pop(context);
                            },
                                child: Text("No",
                              style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)
                              ) ,),
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: ElevatedButton(onPressed: (){
                              showDialog(context: context, builder:(context)=>
                                  AlertDialog(
                                    backgroundColor: HexColor("#edd8b8"),
                                    title: Text("Enter your password",
                                      style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20)) ,),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        DefaultTextFormField(controller: confirmDeleteEmailController,
                                        ),
                                        DefaultTextFormField(controller: confirmDeletePasswordController,
                                            isPassword: true,
                                        ),
                                        const SizedBox(width: 15,),
                                        Container(
                                          width: double.infinity,
                                          child: ElevatedButton(onPressed: (){
                                            UserCubit.get(context).deleteAccount(
                                                confirmDeleteEmailController.text,
                                                confirmDeletePasswordController.text
                                            ).then((value) {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                                            });
                                          },
                                            style : ElevatedButton.styleFrom(primary:  HexColor("#0b6837")) ,
                                            child: Text("Delete",
                                              style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20,)) ,),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              );
                            }, child: Text("Yes",
                              style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 20,)) ,),
                              style : ElevatedButton.styleFrom(primary:  HexColor("#0b6837")) ,),
                          ),
                        ],
                      ),
                      ));
                    },
                  ),
                ],
                ),
                const Spacer(),
                Center(
                  child: Text("Powered by Ayman Haggag©",
                    style: GoogleFonts.autourOne(textStyle: const TextStyle(fontSize: 10)) ,),
                )
              ],
            ),
            appBar: AppBar(
              backgroundColor: HexColor("#edd8b8"),
              title: Text("GREEN",style: GoogleFonts.autourOne(textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.75,
                      child: TextFormField(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const SearchScreen()));
                        },
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                          focusColor: Colors.grey,
                          floatingLabelStyle: const TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 2, //<-- SEE HERE
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
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
                            icon: const Icon(Icons.search,
                            ),
                          ),
                          suffixIconColor: Colors.grey

                        ),
                        style: const TextStyle(color: Colors.grey,fontSize: 15),

                      )
                    ),
                  ),
                ),

              ],
            ),
            body: Stack(
              children: [
                background(
                  sigmaXBlur: 7.5,
                  sigmaYBlur: 7.5
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
                  child: RefreshIndicator(
                    color: Colors.grey,
                    onRefresh: PlantsCubit.get(context).refreshHomePage,
                    child: ConditionalBuilder(
                        condition: state is PlantsLoadingState,
                        builder: (context) => ListView.separated(
                            itemBuilder: (context,index)=>Shimmer.fromColors(
                              baseColor: Colors.grey[500]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 8,),
                                width: MediaQuery.of(context).size.width,
                                height: 180,
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
                                ),
                              ),
                            ),
                            separatorBuilder:(context,index)=> const SizedBox(height: 10),
                            itemCount: 10
                        ),
                        fallback: (context) => ListView.separated(
                            itemBuilder: (context,index)=> PlantCard(plantModel: PlantsCubit.get(context).plantsList[index],),
                            separatorBuilder:(context,index)=> const SizedBox(height: 10),
                            itemCount: PlantsCubit.get(context).plantsList.length
                        ),
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton.extended(
              backgroundColor: HexColor("#edd8b8"),
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ChatPotScreen()));
              },
              label: Row(children: [
                const Icon(
                  Icons.mark_unread_chat_alt_outlined,
                ),
                Text("Chat Pot",style: GoogleFonts.autourOne(textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
                ),

              ],),

            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          ),
        );
      },
    );
  }
}
