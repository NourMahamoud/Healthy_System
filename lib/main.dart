import 'package:doctifityapp/ModelView/Auth/AuthProvider.dart';
import 'package:doctifityapp/View/HomePageScreens/Home_page_screen.dart';
import 'package:doctifityapp/View/Intro_Screens/OnBoarding_Screens.dart';
import 'package:doctifityapp/View/Intro_Screens/Splash_Screen.dart';
import 'package:doctifityapp/utills/Themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doctifityapp/View/screens/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model/home_view_model.dart';
import 'view_model/navigation_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBSo7EbFAclBPssaiEV7xuwYG31pPfh10E',
      appId: '1:67330085138:android:0714197e5729ed5ec263cb',
      messagingSenderId: '67330085138',
      projectId: 'healthysystem-2f20b',
    ),
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => NavigationViewModel()),
        ChangeNotifierProvider(create: (_) => AuthFunctionProvider()),
      ],
      child: const MyApp()));
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
      home: SplashScreen(),
      routes: {
        '/selection': (context) => SelectionScreen(),
        '/signup': (context) => SignUpScreen(),
        '/login' : (context) => LoginPage() ,
        // '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomePageScreen(),
         '/onboarding': (context) => OnBoardingScreen(),
      },

    );
  }
}
