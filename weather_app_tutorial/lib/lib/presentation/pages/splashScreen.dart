import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather_app_tutorial/lib/core/const.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Home_page.dart';

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
    await Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    });
  }
}
