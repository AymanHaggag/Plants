//Flutter Imports:
import 'package:flutter/material.dart';

//Packages Imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//Project Imports:
import 'package:green/constants/constants.dart';
import 'screens/home/cubit/plants_cubit.dart';
import 'screens/home/cubit/plants_states.dart';
import 'screens/home/home_screen.dart';
import 'screens/sign_in/cubit/user_cubit.dart';
import 'screens/sign_in/cubit/user_states.dart';
import 'screens/splash/splash_screen.dart';
import 'tools/bloc/bloc_observer.dart';
import 'tools/storage/local/cashe_helper.dart';
import 'widgets/restart.dart';
import 'generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  uId = await CacheHelper.getData(key: "uId").whenComplete(() {

    Widget openingScreen = const SplashScreen();
    if (uId != null){
      openingScreen = HomeScreen();
    }
  });
  currentLanguage = await CacheHelper.getData(key: "currentLanguage") ?? "en" ;

  Widget openingScreen = const SplashScreen();
  if (uId != null){
    openingScreen = HomeScreen();
  }

  runApp( AppRestart(child: MyApp(openingScreen: openingScreen,)));
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

        locale: Locale(currentLanguage),

        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,

        home: openingScreen,
      ),
    );
  }


}

