import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_tutorial/lib/Application/Current_Location/bloc/current_loccation_bloc.dart';
import 'package:weather_app_tutorial/lib/Application/bloc/homebloc_bloc.dart';
import 'package:weather_app_tutorial/lib/core/const.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Widgets/homeScreenPad.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/loginPage/loginpage.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocBuilder<HomeblocBloc, HomeblocState>(
            builder: (context, state1) {
             
              if (state1.Islooding) {
                return CircularProgressIndicator(
                  strokeWidth: 2,
                );
              }
              return Column(
                children: [
                  BlocBuilder<CurrentLoccationBloc, CurrentLoccationState>(
                    builder: (context, state) {
                      print("CurrentLoccationBloc State: $state");
                      return Text.rich(
                        TextSpan(
                            text:
                                '${state1.name ?? state.area ?? "City Not Found"}'),
                        style: TextStyle(
                          fontFamily: AutofillHints.addressCity,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    },
                  ),
                  Text.rich(
                    TextSpan(text: '${state1.wetherdescription}'),
                    style: TextStyle(
                      fontFamily: AutofillHints.addressCity,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const HomeScreenWetherPad(),
                  ElevatedButton.icon(
                    onPressed: () {
                      navigatorKey.currentState?.pushNamed("Search");
                    },
                    icon: Icon(Icons.search),
                    label: Text("Search"),
                  ),
                ],
              );
            },
          ),
          ElevatedButton(
            onPressed: () async {
  await FirebaseAuth.instance.signOut();
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => LoginPage()),
    (Route<dynamic> route) => false,
  );
},

            child: Text("Logout"),
          )
        ],
      ),
    );
  }
}
