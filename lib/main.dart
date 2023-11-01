import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:green/constants/constants.dart';
import 'package:green/layout/cubit/plants_cubit.dart';
import 'package:green/layout/cubit/plants_states.dart';
import 'package:green/layout/home_screen/home_screen.dart';
import 'package:green/modules/get_started_screen/get_started_screen.dart';
import 'package:green/modules/login_screen/cubit/user_cubit.dart';
import 'package:green/modules/login_screen/cubit/user_states.dart';
import 'package:green/modules/splash_screen/splash_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:green/tools/bloc_observer/bloc_observer.dart';
import 'package:green/tools/local_storage_tool/cashe_helper.dart';

import 'modules/login_screen/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  await CacheHelper.init();
  uId = await CacheHelper.getData(key: "uId").then((value) {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> uId = $uId");
  });

  Widget openingScreen = SplashScreen();
  if (uId != null){
    openingScreen = HomeScreen();
  }

  runApp( MyApp(openingScreen: openingScreen,));
}

class MyApp extends StatelessWidget {
   MyApp({required this.openingScreen ,super.key});
   Widget openingScreen;

   @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>UserCubit(UserInitialState())..getUserData(),
        ),
        BlocProvider(
          create: (context) => PlantsCubit(PlantsInitialState())..refreshHomePage()..getFAQs(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: openingScreen,
      ),
    );
  }
}

