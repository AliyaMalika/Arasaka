import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('Profile'),
              ),
              SizedBox(height: 46),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/timetable');
                },
                child: Text('Timetable'),
              ),
              SizedBox(height: 46),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/maps');
                },
                child: Text('Maps'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
