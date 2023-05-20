import 'package:flutter/material.dart';

class MapsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 88, 212, 243),
              Color.fromARGB(255, 48, 163, 167),
              Color.fromARGB(255, 6, 133, 133)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Maps',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              // TODO: Implement maps functionality
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Go back to the homepage
                },
                child: Text('Back to Homepage'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
