import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/constants/constants.dart';
import 'package:green/layout/cubit/plants_states.dart';
import 'package:green/models/faq_model.dart';
import 'package:green/models/plant_model.dart';
import 'package:green/models/plant_details_model.dart';
import 'package:green/models/saved_plant_model.dart';
import 'package:green/tools/Api_tool/dio_helper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';



class PlantsCubit extends Cubit<PlantsStates> {
  PlantsCubit(super.initialState);

  static PlantsCubit get(context) => BlocProvider.of(context);

  List<PlantModel> plantsList = [];

  Future<void> getPlants({required int page}) async {
    emit(PlantsLoadingState());

    plantsList = [];
    await DioHelper.getData(
            url:
                "https://perenual.com/api/species-list",
            query: {
              "key" : "sk-2ftu651db7e2da31f2345",
              "page" : page,
             })
        .then((value) {
      value.data["data"].forEach((element) {
        plantsList.add(PlantModel.fromJson(element));
      });
      emit(PlantsGetDataSuccessfulState());
    }).catchError((error) {
      print(error.toString());
      emit(PlantsGetDataErrorState());
    });
  }

  late PlantDetailsModel plantDetails;

  Future getPlantData({required int plantId}) async {
    emit(PlantsGetPlantDataLoadingState());
    await DioHelper.getData(
        url: "https://perenual.com/api/species-care-guide-list",
        query: {
          "key": "sk-2ftu651db7e2da31f2345",
          "page": 1,
          "species_id": plantId
        }).then((value) {
      plantDetails = PlantDetailsModel.fromJson(value.data["data"][0]);

      emit(PlantsGetPlantDataSuccessfulState());
    }).catchError((error) {
      print(error.toString());

      emit(PlantsGetPlantDataErrorState());
    });
  }

  Future<void> refreshHomePage() => Future.delayed(Duration(seconds: 0), () {
    final random = Random();
  getPlants(page: random.nextInt(100) + 1).then((value) {
      print(plantsList.length);
    });

  });


 List<FAQModel> faqsModelList =[];
  Future getFAQs () async{
    emit(PlantsGetFAQsLoadingState());

    await DioHelper.getData(
        url: "https://perenual.com/api/article-faq-list?key=sk-2ftu651db7e2da31f2345&page=2",
      query: {
        "key": "sk-2ftu651db7e2da31f2345",
        "page": 1,

      }
    )
        .then((value){
          value.data["data"].forEach((element){
            faqsModelList.add(FAQModel.fromJson(element));
          });

          emit(PlantsGetFAQsSuccessfulState());


    })
        .catchError((error){
          print(error.toString());
          emit(PlantsGetFAQsErrorState());

    });

  }

  List<PlantDetailsModel> searchPlantsList =[];
  Future plantSearch ({
    required String? search,
}) async{
    emit(PlantsLoadingState());
    searchPlantsList =[];
    await DioHelper.getData(
        url: "https://www.perenual.com/api/species-care-guide-list",
    query: {
      "key": "sk-2ftu651db7e2da31f2345",
      "q" : search
    }
    )
        .then((value) {
        value.data["data"].forEach((element) {
          searchPlantsList.add(PlantDetailsModel.fromJson(element));
      });
          emit(PlantsSearchSuccessfulState());

    })
        .catchError((error){
          print(error.toString());
      emit(PlantsSearchErrorState());


    });
  }

  Future<void> savePlant (
      {
        required int? id,
        required String? commonName,
        required String? image,
        required String? wateringShort,
        required String? sunLightShort,
        required String? watering,
        required String? wateringDescription,
        required String? sunLight,
        required String? sunLightDescription,
        required String? pruning,
        required String? pruningDescription,


      }
      ) async{

    SavedPlantModel savedPlantModel = SavedPlantModel(
      id: id,
      commonName: commonName,
      image: image,
      wateringShort: wateringShort,
      sunLightShort: sunLightShort,
      watering: watering,
      wateringDescription: wateringDescription,
      sunLight: sunLight,
      sunLightDescription: sunLightDescription,
      pruning: pruning,
      pruningDescription: pruningDescription

    );

    FirebaseFirestore.instance
        .collection("saved plants")
        .doc(uId)
        .collection('user plants')
        .doc("$id")
        .set(savedPlantModel.toMap())
        .then((value) {
          print(uId);
      emit(PlantsSavePlantSuccessfulState());
    })
        .catchError(() {
      emit(PlantsSavePlantErrorState());
    }
    );
  }

  List<SavedPlantModel> savedPlantsList =[];
  Future getSavedPlants ({
    required String uId,

  }) async{
    emit(PlantsLoadingState());


    await FirebaseFirestore.instance
        .collection("saved plants")
        .doc(uId)
        .collection("user plants")
        .snapshots()
        .listen((event) {

      savedPlantsList.clear();

      event.docs.forEach((element) {

        savedPlantsList.add(SavedPlantModel.fromJson(element.data()));
        print(">>>>>>>>>>>>>>>>>>>>>>>>Get Saved plants");
      }

      );
          emit(PlantsGetSavedPlantsSuccessfulState());
    });


  }


}
