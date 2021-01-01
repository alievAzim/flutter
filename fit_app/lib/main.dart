import 'package:fit_app/screens/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaxFitApp());
}

class MaxFitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Max Fitness',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(50, 65, 85, 1),
            // ignore: deprecated_member_use
            textTheme: TextTheme(title: TextStyle(color: Colors.white))),
        debugShowCheckedModeBanner: false,
        home: LandingPage());
  }
}
