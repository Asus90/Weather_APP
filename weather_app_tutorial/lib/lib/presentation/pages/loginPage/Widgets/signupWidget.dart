import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Home_page.dart';

Future<void> signupUser(BuildContext ctx, TextEditingController _pass,
    TextEditingController _email) async {
  if (_pass.text.isNotEmpty && _email.text.isNotEmpty) {
    try {
      final userData = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text,
        password: _pass.text,
      );

      if (userData.user != null) {
        Navigator.of(ctx).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      print('Login failed: $e');

      showDialog(
        context: ctx,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Invalid email or password. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
