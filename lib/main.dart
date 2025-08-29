import 'package:doctifityapp/View/Introduction_Screens/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:doctifityapp/View/AuthScreens/Selection_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
