import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_app_tutorial/lib/core/const.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Home_page.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/loginPage/loginpage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("WELCOME"),
      ),
    );
  }

  splashScreen() async {
    final bool userExists = await CheckUser();
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => userExists ? HomePage() : LoginPage(),
      ));
    });
  }
}

Future<bool> CheckUser() async {
  final uid = FirebaseAuth.instance.currentUser?.uid;

  final result = await FirebaseFirestore.instance.collection('user').doc(uid).get();
  print(result.id==uid);
  if(result.id==uid){

  return true;
  }else{
    return false;
  }
}