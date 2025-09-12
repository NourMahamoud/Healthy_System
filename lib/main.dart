import 'package:doctifityapp/ModelView/Auth/AuthProvider.dart';
import 'package:doctifityapp/View/AuthScreens/Selection_Screen.dart';
import 'package:doctifityapp/View/AuthScreens/Sign_In_Screen.dart';
import 'package:doctifityapp/View/AuthScreens/Sign_up_Screen.dart';
import 'package:doctifityapp/View/CompleteAccount/CompleteAcountPage.dart';
import 'package:doctifityapp/View/Intro_Screens/OnBoarding_Screens.dart';
import 'package:doctifityapp/View/Intro_Screens/Splash_Screen.dart';
import 'package:doctifityapp/utills/Themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'View/HomePageScreens/Home_page_screen.dart';
import 'View/HomePageScreens/Specialists.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBSo7EbFAclBPssaiEV7xuwYG31pPfh10E',
      appId: '1:67330085138:android:0714197e5729ed5ec263cb',
      messagingSenderId: '67330085138',
      projectId: 'healthysystem-2f20b',
    ),
  );
  await Supabase.initialize(
    url: 'https://yfihruhoyrlgzcqgvyfo.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlmaWhydWhveXJsZ3pjcWd2eWZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTc0Mjc5MjksImV4cCI6MjA3MzAwMzkyOX0.GgeUHDtIU1t07b8Vilsv3EcWjOMAmBCYd4QcEaX_K04',
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthFunctionProvider()),
      ],
      child: const MyApp(),
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
      themeMode: ThemeMode.light,
      theme: AppThemes().lightTheme,
      darkTheme: AppThemes().darkTheme,
      home: Specialists(),
      routes: {
        '/selection': (context) => SelectionScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login': (context) => LoginPage(),
        // '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomeScreen(),
        '/onboarding': (context) => OnBoardingScreen(),
        '/splash': (context) => SplashScreen(),
        '/homePage': (context) => HomePageScreen(),
        '/specialists': (context) => Specialists(),
      },
    );
  }
}
