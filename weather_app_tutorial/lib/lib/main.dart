import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_tutorial/lib/Application/Current_Location/bloc/current_loccation_bloc.dart';
import 'package:weather_app_tutorial/lib/Application/bloc/homebloc_bloc.dart';
import 'package:weather_app_tutorial/lib/core/const.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Home_page.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Widgets/SearchSection.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/loginPage/loginpage.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void>  main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDVJ90dDTA2WXePp1hd8pssqhghzSqvyIE",
      appId: "1:360338590406:android:f0ebd70b864acc30df25c7",
      messagingSenderId: "360338590406",
      projectId: "weatherapp123-99af7",
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
 
    
  }

  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeblocBloc>(
          create: (BuildContext context) => HomeblocBloc(),

        ),
         BlocProvider<CurrentLoccationBloc>(
          create: (BuildContext context) => CurrentLoccationBloc(),
          
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        routes: {'Search': (context) => SearchSection(),'LoginPage': (context) => LoginPage(),},
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}


