import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signUp_screen.dart';
import 'login_screen.dart';
import 'reusableWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Log Out"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              print("Signed Out");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            });
          },
        ),
      ),
    );
  }
}
