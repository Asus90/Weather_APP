import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_tutorial/lib/Application/Current_Location/bloc/current_loccation_bloc.dart';
import 'package:weather_app_tutorial/lib/Application/bloc/homebloc_bloc.dart';

class HomeScreenWetherPad extends StatelessWidget {
  const HomeScreenWetherPad({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentLoccationBloc, CurrentLoccationState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return Text("Loading..\n  Getting Your Current Location");
        }else{
           return Container(
          height: 100,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11.2),
            color: const Color.fromARGB(255, 184, 184, 184),
          ),
          child: BlocBuilder<HomeblocBloc, HomeblocState>(
            builder: (context, state1) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${state.temMain ?? state1.tembmain ?? 'Not found'}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 254, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "${state.long ?? state1.humidity ?? 'Not found'}",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 254, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "${state.windspeed ?? state1.windspeed ?? 'not found'}",
                        style: TextStyle(
                          color: Color.fromARGB(255, 254, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        );
        }
       
      },
    );
  }
}
