import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Home_page.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/loginPage/Widgets/signupWidget.dart';

class Signup extends StatelessWidget {
  const Signup();

  @override
  Widget build(BuildContext context) {
    final _email = TextEditingController();
    final _pass = TextEditingController();

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 210, 206, 206),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(hintText: " Email "),
                controller: _email,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 189, 189, 189),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(hintText: " Password "),
                controller: _pass,
              ),
            ),
            ElevatedButton(
  onPressed: () async {
    if (_pass.text.isEmpty || _email.text.isEmpty) {
      showDialog(
        context: context,
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
    } else {
      await signupUser(context, _pass, _email);
    }
  },
  child: Text("Signup"),
),

          ],
        ),
      ),
    );
  }
}
