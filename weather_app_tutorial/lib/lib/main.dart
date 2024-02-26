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
import 'package:weather_app_tutorial/lib/presentation/pages/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void>  main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  
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
    add();
    
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
        routes: {'Search': (context) => SearchSection()},
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


add()async{
 await FirebaseFirestore.instance.collection('user').add({
      'name':'hasanmk'
    });
}