// Flutter imports:
import 'package:flutter/material.dart';

// Packages imports:
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// project imports:
import 'package:green/constants/constants.dart';
import 'package:green/generated/l10n.dart';
import '../../widgets/loading_indecator.dart';
import '../../widgets/show_dialog.dart';
import '../home/cubit/plants_cubit.dart';
import '../home/cubit/plants_states.dart';


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
          backgroundColor: secondaryColor,
          appBar: AppBar(
            backgroundColor: mainColor,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.75,
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.text,
                        cursorColor: secondaryColor,
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
                                PlantsCubit.get(context)
                                    .plantSearch(search: searchController.text);
                              },
                              icon: const Icon(
                                Icons.search,
                              ),
                            ),
                            suffixIconColor: Colors.grey),
                        style:
                            TextStyle(color: secondaryColor, fontSize: 15),
                      )),
                ),
              ),
            ],
          ),
          body: Stack(
            children: [
              ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          showDataAlert(context,
                              PlantsCubit.get(context).searchPlantsList[index]);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .08,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.15),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: mainColor,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Text(
                                        PlantsCubit.get(context)
                                            .searchPlantsList[index]
                                            .commonName as String,
                                        style: GoogleFonts.autourOne(
                                          textStyle: TextStyle(
                                            fontSize: 30,
                                            color: secondaryColor,
                                          ),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .95,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                            "Other Name: ",
                                            style: GoogleFonts.autourOne(
                                              textStyle: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black
                                                    .withOpacity(.5),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .65,
                                            child: Text(
                                              PlantsCubit.get(context)
                                                      .searchPlantsList[index]
                                                      .scientificName![0] ??
                                                  "",
                                              style: GoogleFonts.autourOne(
                                                textStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black
                                                      .withOpacity(.5),
                                                ),
                                              ),
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
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: PlantsCubit.get(context).searchPlantsList.length),
              if (state is PlantsLoadingState)
                const AppLoadingIndicator()
            ],
          ),
        );
      },
    );
  }
}

