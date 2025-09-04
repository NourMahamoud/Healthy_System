import 'package:doctifityapp/View/screens/Introduction_Screens/Splash_Screen.dart';
import 'package:doctifityapp/View/screens/main_screens/Appointments_screen.dart';
import 'package:doctifityapp/View/screens/main_screens/MyAccount_screen.dart';
import 'package:doctifityapp/View/screens/main_screens/home_screen.dart';
import 'package:doctifityapp/View/screens/main_screens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:doctifityapp/View/screens/AuthScreens/Selection_Screen.dart';
import 'package:provider/provider.dart';
import 'View/screens/main_navigation.dart';
import 'view_model/home_view_model.dart';
import 'view_model/navigation_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
