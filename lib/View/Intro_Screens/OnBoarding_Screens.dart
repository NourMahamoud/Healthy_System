import 'package:doctifityapp/utills/AppRoutes.dart';
import 'package:doctifityapp/utills/ImagePath.dart' ;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      controlsPadding: EdgeInsets.only(bottom: 50),
      curve: Curves.easeOutCubic,
      dotsDecorator: DotsDecorator(
        activeColors: [Colors.blue, Colors.blue, Colors.blue],
      ),
      pages: [
        PageViewModel(
          title: "Find top doctors",
          body: "Search and book appointments with top doctors near you.",
          image: Image.asset(
            ImagePath.onBoarding1,
            alignment: Alignment.center,
          ),
          decoration: const PageDecoration(
            contentMargin: EdgeInsets.only(top: 80),
            imagePadding: EdgeInsets.only(top: 50),
          ),
        ),
        PageViewModel(
          title: "Track your bookings",
          body:
              "Stay updated with your upcoming appointments and changes in one place.",
          image: Image.asset(ImagePath.onBoarding2),
          decoration: const PageDecoration(
            contentMargin: EdgeInsets.only(top: 80),
            imagePadding: EdgeInsets.only(top: 50),
          ),
        ),
        PageViewModel(
          title: "Easily and safely with our app",
          body:
              "Book, track, and manage your appointments anytime — with full safety and ease.",
          image: Image.asset(ImagePath.onBoarding3),
          decoration: const PageDecoration(
            contentMargin: EdgeInsets.only(top: 80),
            imagePadding: EdgeInsets.only(top: 50),
          ),
        ),
      ],

      showSkipButton: true,
      skip: Text(
        "Skip",
        style: TextStyle(fontSize: 16, color: Colors.blue[900]),
      ),
      next: Icon(Icons.arrow_forward, size: 25, color: Colors.blue[900]),
      done: Text(
        "Get Started",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.blue[700],
        ),
      ),
      onDone: () {
        // Navigate to home or login
    Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);},
      onSkip: (){
        Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
      },
    );
  }
}
