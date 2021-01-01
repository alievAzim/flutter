import 'package:fit_app/screens/auth.dart';
import 'package:fit_app/screens/home.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;
    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
