import 'package:flutter/material.dart';
import 'package:doctifityapp/View/AuthScreens/Sign_In_Screen.dart';
import 'package:doctifityapp/View/AuthScreens/Sign_up_Screen.dart';
import 'package:doctifityapp/View/CompleteAccount/CompleteAcountPage.dart';
import 'package:doctifityapp/View/HomePageScreens/Home_page_screen.dart';
import 'package:doctifityapp/View/Intro_Screens/OnBoarding_Screens.dart';
import 'package:doctifityapp/View/Intro_Screens/Splash_Screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String homeScreen = '/home';
  static const String signUpScreen = '/signup';
  static const String onBoardingScreen = '/onboardingScreen';
  static const String completeAccountScreen = '/completeAccount';
  static const String loginScreen = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case homeScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => HomePage(id: args['id']),
        );

      case loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case completeAccountScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => CompleteAccountPage(
            id: args['id'],
            rule: args['rule'],
            email: args['email'],
            name: args['name'],
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Route not found")),
          ),
        );
    }
  }
}
