import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Home_page.dart';

Future<void> loginFirebaseLogic(BuildContext ctx,_pass,_email) async {
    if (_pass.text.isNotEmpty && _email.text.isNotEmpty) {
      try {
        final userData =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _pass.text,
        );

        if (userData.user != null) {
          await FirebaseFirestore.instance
              .collection('user')
              .doc(userData.user!.uid)
              .collection("dtls")
              .add({
            "email": userData.user!.email,
            'uid': userData.user!.uid,
          });

          Navigator.of(ctx).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()));
        }
      } catch (e) {
        print('Login failed: $e');
      }
    }
  }

