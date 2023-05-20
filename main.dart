import 'package:flutter/material.dart';
import 'package:homepage/profile_page.dart';
import 'package:homepage/timetable_page.dart';
import 'home_page.dart';
import 'maps_page.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import 'pages/timetable_page.dart';
import 'pages/maps_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profile': (context) => ProfilePage(),
        '/timetable': (context) => TimetablePage(),
        '/maps': (context) => MapsPage(),
      },
    );
  }
}
