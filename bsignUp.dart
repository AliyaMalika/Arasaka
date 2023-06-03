import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'reusableWidget.dart';
import 'home_page.dart';
import 'asignIn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _matricNumberTextController = TextEditingController();
  TextEditingController _userTypeTextController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 204, 153, 1),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
                "Enter Your Name",
                Icons.people_alt_outlined,
                false,
                _nameTextController,
              ),
              SizedBox(
                height: 20,
              ),
              reusableTextField(
                "Enter Matric Number",
                Icons.people_alt_outlined,
                false,
                _matricNumberTextController,
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
                "Enter Password",
                Icons.lock_outline,
                true,
                _passwordTextController,
              ),
              SizedBox(
                height: 20,
              ),
              signUpButton(
                context,
                true,
                () async {
                  try {
                    UserCredential userCredential = await _auth
                        .createUserWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );

                    // Store additional user information in Firestore
                    await _firestore.collection('users').doc(userCredential.user!.uid).set({
                      'email': _emailTextController.text,
                      'name': _nameTextController.text,
                      'userType': _userTypeTextController.text,
                      'password': _passwordTextController.text,
                      'matricNumber': _matricNumberTextController.text,
                    });

                    // Sign-up successful, navigate to the home page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } catch (e) {
                    // Handle sign-up errors
                    print('Sign-up error: $e');
                    // Show an error message to the user
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Sign-up Error'),
                        content: Text('An error occurred during sign-up.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              backButton(
                context,
                true,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
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
