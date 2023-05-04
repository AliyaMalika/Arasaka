import 'package:flutter/material.dart';
import 'reusableWidget.dart';
import 'chome.dart';
import 'asignin.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _userTypeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 248, 209, 149),
              Color.fromARGB(255, 24, 94, 199),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            20,
            MediaQuery.of(context).size.height * 0.2,
            20,
            0,
          ),
          child: Column(
            children: <Widget>[
              reusableTextField(
                "Are you Student/Lecturer/Admin?",
                Icons.people_alt_outlined,
                false,
                _userTypeTextController,
              ),
              SizedBox(
                height: 20,
              ),
              reusableTextField(
                "Enter Email",
                Icons.email_outlined,
                false,
                _emailTextController,
              ),
              SizedBox(
                height: 20,
              ),
              reusableTextField(
                "Enter Username",
                Icons.person_outline,
                false,
                _usernameTextController,
              ),
              SizedBox(
                height: 20,
              ),
              reusableTextField(
                "Enter Password",
                Icons.lock_outline,
                true,
                _passwordTextController,
              ),
              SizedBox(
                height: 20,
              ),
              signInSignUpButton(
                context,
                true,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
