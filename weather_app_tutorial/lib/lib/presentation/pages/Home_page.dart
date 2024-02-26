import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:weather_app_tutorial/lib/Application/Current_Location/bloc/current_loccation_bloc.dart';
import 'package:weather_app_tutorial/lib/Application/bloc/homebloc_bloc.dart';
import 'package:weather_app_tutorial/lib/core/const.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherFactory wf = WeatherFactory(OPENWEATHER_API_KEY);

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CurrentLoccationBloc>(context).add(GetCurrentLOcation());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return HomeSection(context: context);
  }
}
