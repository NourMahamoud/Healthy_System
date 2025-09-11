import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      bodyPadding: EdgeInsets.all(29),
      controlsPadding: EdgeInsets.only(bottom: 30),
      curve: Curves.easeOutCubic,
      dotsDecorator: DotsDecorator(
        activeColors: [Colors.blue, Colors.blue, Colors.blue],
      ),
      pages: [
        PageViewModel(
          title: "Find top doctors",
          body: "Search and book appointments with top doctors near you.",
          image: Image.asset(
            AppImages.onBoarding1,
            alignment: Alignment.center,
          ),
          decoration: const PageDecoration(
            imagePadding: EdgeInsets.only(
              top: 50,
            ), // 👈 controls image position
          ),
        ),
        PageViewModel(
          title: "Track your bookings",
          body:
              "Stay updated with your upcoming appointments and changes in one place.",
          image: Image.asset(AppImages.onBoarding2),
          decoration: const PageDecoration(
            imagePadding: EdgeInsets.only(top: 50),
          ),
        ),
        PageViewModel(
          title: "Easily and safely with our app",
          body:
              "Book, track, and manage your appointments anytime — with full safety and ease.",
          image: Image.asset(AppImages.onBoarding3),
          decoration: const PageDecoration(
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
        "Done",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.blue[900],
        ),
      ),
      onDone: () {
        // Navigate to home or login
        Navigator.of(context).pushReplacementNamed('/login');
      },
    );
  }
}

// Dummy Home Screen for testing
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Doctify")),
      body: Center(
        child: Text(
          "Dummy Home Screen for testing",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
