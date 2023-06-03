import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'reusableWidget.dart';
import 'home_page.dart';
import 'bsignUp.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

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
              logoWidget("assets/images/logo.png"),
              SizedBox(
                height: 30,
              ),
              reusableTextField(
                "Enter Email",
                Icons.person_outline,
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
              signInButton(
                context,
                true,
                () async {
                  try {
                    UserCredential userCredential =
                        await _auth.signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text,
                    );
                    // Sign-in successful, navigate to the home page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } catch (e) {
                    // Handle sign-in errors
                    print('Sign-in error: $e');
                    // Show an error message to the user
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Sign-in Error'),
                        content: Text('An error occurred during sign-in.'),
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
              signUpOption(),
              forgotPasswordButton(), // Add the "Forgot Password" button
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.black87),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: const Text(
            "  Sign Up",
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget forgotPasswordButton() {
    return TextButton(
      onPressed: () {
        // Handle "Forgot Password" button tap
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Forgot Password'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Enter your email to reset your password:'),
                SizedBox(height: 10),
                TextField(
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Reset Password'),
                onPressed: () {
                  // Perform the password reset logic here
                  // You can use the FirebaseAuth instance to send a password reset email
                  String email = _emailTextController.text; // Get the entered email
                  _auth.sendPasswordResetEmail(email: email);
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Password Reset'),
                      content: Text('A password reset link has been sent to your email.'),
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
                },
              ),
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
}
