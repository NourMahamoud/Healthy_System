import 'package:doctifityapp/ModelView/Auth/AuthProvider.dart';
import 'package:doctifityapp/ModelView/HomePageProvider/LogicProviderHomeScreen.dart';

import 'package:doctifityapp/utills/Themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/home_view_model.dart';
import 'view_model/navigation_view_model.dart';

import 'package:doctifityapp/utills/AppRoutes.dart';


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
        ChangeNotifierProvider(create: (_)=> HomePageProvider('999')),
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
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: AppRoutes.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,



    );
  }
}

