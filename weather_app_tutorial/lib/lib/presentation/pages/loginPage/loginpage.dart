import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/loginPage/Widgets/loginwidgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _email=TextEditingController();
    final _Pass=TextEditingController();
    return Scaffold(
      body: LoginWidget(email: _email, pass: _Pass)
    );
  }
}
