// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/constants/constants.dart';
import 'package:green/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:green/widgets/text_form_field.dart';
import 'package:green/widgets/toast.dart';

// Project imports:
import '../../tools/storage/local/cashe_helper.dart';
import '../../widgets/plant_card.dart';
import '../../widgets/shimmer.dart';
import '../faqs/faqs_screen.dart';
import '../saved/saved_screen.dart';
import '../search/search_screen.dart';
import '../sign_in/cubit/user_cubit.dart';
import '../sign_in/sign_in_screen.dart';
import '../updates/updates_screen.dart';
import 'cubit/plants_cubit.dart';
import 'cubit/plants_states.dart';


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
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: secondaryColor,
            drawer: NavigationDrawer(
              backgroundColor:
              Theme.of(context).scaffoldBackgroundColor.withOpacity(.7),
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                size: 30,
              ),
              title: Text(
                S.of(context).home,
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 20)),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.bookmark_border_outlined,
                size: 30,
              ),
              title: Text(
                S.of(context).saved,
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 20)),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SavedScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.update,
                size: 30,
              ),
              title: Text(
                S.of(context).updates,
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 20)),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UpdatesScreen()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.question_mark_outlined,
                size: 30,
              ),
              title: Text(
                S.of(context).FAQs,
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 20)),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FAQsScreen()));
              },
            ),
            ExpansionTile(
              title: Text(
                "language",
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 20)),
              ),
              iconColor: Colors.green,
              textColor: Colors.green,
              children: [
                ListTile(
                  title: Text(
                    "العربية",
                    style: GoogleFonts.autourOne(
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                  onTap: (){PlantsCubit.get(context).changeLanguage(language: "ar", context: context);},
                ),
                ListTile(
                  title: Text(
                    "English",
                    style: GoogleFonts.autourOne(
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                  onTap: (){PlantsCubit.get(context).changeLanguage(language: "en", context: context);},
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            ExpansionTile(
              title: Text(
                S.of(context).account,
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 20)),
              ),
              iconColor: Colors.green,
              textColor: Colors.green,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  title: Text(
                    S.of(context).signOut,
                    style: GoogleFonts.autourOne(
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                  onTap: () {
                    CacheHelper.deleteData(key: "uId").then((value) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                              (route) => false);
                      showToast("logout successful", ToastStates.success);
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.delete_forever_outlined,
                    size: 30,
                  ),
                  title: Text(
                    S.of(context).deleteAccount,
                    style: GoogleFonts.autourOne(
                        textStyle: const TextStyle(fontSize: 20)),
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: mainColor,
                          title: Text(
                            "Are you sure you want to delete your account?",
                            style: GoogleFonts.autourOne(
                                textStyle:
                                const TextStyle(fontSize: 20)),
                          ),
                          content: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      textColor),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "No",
                                    style: GoogleFonts.autourOne(
                                        textStyle: const TextStyle(
                                            fontSize: 20)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            AlertDialog(
                                              backgroundColor:
                                              mainColor,
                                              title: Text(
                                                "Enter your password",
                                                style: GoogleFonts.autourOne(
                                                    textStyle:
                                                    const TextStyle(
                                                        fontSize:
                                                        20)),
                                              ),
                                              content: Column(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                children: [
                                                  AppTextFormField(
                                                    controller:
                                                    confirmDeleteEmailController,
                                                  ),
                                                  AppTextFormField(
                                                    controller:
                                                    confirmDeletePasswordController,
                                                    isPassword: true,
                                                  ),
                                                  const SizedBox(
                                                    width: 15,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                    double.infinity,
                                                    child:
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        UserCubit.get(
                                                            context)
                                                            .deleteAccount(
                                                            confirmDeleteEmailController
                                                                .text,
                                                            confirmDeletePasswordController
                                                                .text)
                                                            .then(
                                                                (value) {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          LoginScreen()));
                                                            });
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                          textColor),
                                                      child: Text(
                                                        "Delete",
                                                        style: GoogleFonts
                                                            .autourOne(
                                                            textStyle:
                                                            const TextStyle(
                                                              fontSize: 20,
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      textColor),
                                  child: Text(
                                    "Yes",
                                    style: GoogleFonts.autourOne(
                                        textStyle: const TextStyle(
                                          fontSize: 20,
                                        )),
                                  ),
                                ),
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
              child: Text(
                "Powered by Ayman Haggag©",
                style: GoogleFonts.autourOne(
                    textStyle: const TextStyle(fontSize: 10, color: Colors.black38)),
              ),
            )
          ],
        ),
            appBar: AppBar(

              backgroundColor: mainColor,
              title: Text(
                "GREEN",
                style: GoogleFonts.autourOne(
                  textStyle: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.75,
                        child: TextFormField(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const SearchScreen()));
                          },
                          controller: searchController,
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                              focusColor: Colors.grey,
                              floatingLabelStyle:
                                  const TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 2, //<-- SEE HERE
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(30)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1, //<-- SEE HERE
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              hintText: S.of(context).search,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  debugPrint(searchController.text);
                                  PlantsCubit.get(context).plantSearch(
                                      search: searchController.text);
                                },
                                icon: const Icon(
                                  Icons.search,
                                ),
                              ),
                              suffixIconColor: Colors.grey),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 15),
                        )),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                  child: RefreshIndicator(
                    color: Colors.grey,
                    onRefresh: PlantsCubit.get(context).refreshHomePage,
                    child: ConditionalBuilder(
                      condition: state is PlantsLoadingState,
                      builder: (context) => ListView.separated(
                          itemBuilder: (context, index) => AppShimmer(
                                widget: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.6),
                                        offset: const Offset(
                                         6.0,
                                          10.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: -6.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount: 10),
                      fallback: (context) => ListView.separated(
                          itemBuilder: (context, index) => AppPlantCard(
                                plantModel:
                                    PlantsCubit.get(context).plantsList[index],
                              ),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                          itemCount:
                              PlantsCubit.get(context).plantsList.length),
                    ),
                  ),
                ),
              ],
            ),
           /* floatingActionButton: FloatingActionButton.extended(
              backgroundColor: mainColor,
              foregroundColor: Colors.white,
              onPressed: () {

              },
              label: Row(
                children: [
                  const Icon(
                    Icons.mark_unread_chat_alt_outlined,
                  ),
                  Text(
                    "Chat Pot",
                    style: GoogleFonts.autourOne(
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,*/
          ),
        );
      },
    );
  }
}
