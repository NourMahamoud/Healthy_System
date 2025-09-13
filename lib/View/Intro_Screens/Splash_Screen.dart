import 'dart:async';
import 'package:doctifityapp/View/Intro_Screens/SplachScreenController.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _heartbeatController;
  late AnimationController _glowController;

  @override
  void initState() {
    super.initState();

    // Heartbeat effect
    _heartbeatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    // Glow animation
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _heartbeatController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      SplachScreenController().checkUser(context) ;
    } ) ;
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 3),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.blue.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _heartbeatController,
              _glowController,
            ]),
            builder: (context, child) {
              double heartbeat = 1 + 0.1 * _heartbeatController.value;

              return Transform.scale(
                scale: heartbeat,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    // if you would to try it but i think without it is better
                    /*
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent,
                        blurRadius: glow,
                        spreadRadius: 3,
                      ),
                    ],
                    */
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(ImagePath.logo, height: 120, width: 500),
                      const SizedBox(height: 16),
                      Text(
                        "Doctify",
                        style: GoogleFonts.novaScript(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
