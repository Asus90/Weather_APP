import 'package:cloud_firestore/cloud_firestore.dart';
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

      final userExistOrNot = await FirebaseFirestore.instance
          .collection('user')
          .doc(userData.user!.uid)
          .get();
      final uid = userExistOrNot.id;
      print(uid);
      if (userExistOrNot.id.isNotEmpty && uid == userExistOrNot.id) {
        Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        print("User does not exist");
      }
    } catch (e) {
      print('Login failed: $e');
    }
  }
}
