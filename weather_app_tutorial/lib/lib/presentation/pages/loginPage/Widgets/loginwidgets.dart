import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/Home_page.dart';
import 'package:weather_app_tutorial/lib/presentation/pages/loginPage/signup.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
    required TextEditingController email,
    required TextEditingController pass,
  })  : _email = email,
        _pass = pass,
        super(key: key);

  final TextEditingController _email;
  final TextEditingController _pass;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 210, 206, 206),
                borderRadius: BorderRadius.circular(12)),
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
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              decoration: InputDecoration(hintText: " Password "),
              controller: _pass,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if(_pass.text.isEmpty || _email.text.isEmpty){
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
          );});
              }
              await loginFirebaseLogic(context);
            },
            child: Text("Login"),
          ),

          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Signup(),));
             
            },
            child: Text("Signup"),
          ),
        ],

        
      ),
    );
  }

    Future<void> loginFirebaseLogic(BuildContext ctx) async {
    if (_pass.text.isNotEmpty && _email.text.isNotEmpty) {
      try {
        final userData = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _pass.text,
        );

        if (userData.user != null) {
          await FirebaseFirestore.instance.collection('user').doc(userData.user!.uid).collection("dtls").add({
            "email": userData.user!.email,
            'uid': userData.user!.uid,
          });

         
          Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
        }
      } catch (e) {
       
        print('Login failed: $e');
      }
    }
  }
}