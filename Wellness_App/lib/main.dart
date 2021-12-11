import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Alerts.dart';
import 'package:flutter_auth/Screens/Dashboard/HomePage.dart';
import 'package:flutter_auth/Screens/Faq.dart';
import 'package:flutter_auth/Screens/OtpScreen.dart';
import 'package:flutter_auth/Screens/TutorialsScreen.dart';
import 'package:flutter_auth/Screens/TutorsScreen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
