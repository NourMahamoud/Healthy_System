import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:doctifityapp/utills/ImagePath.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Row(
              children: [
                // Stack(
                //   children: [
                //     CircleAvatar(
                //       radius: 30,
                //       // backgroundImage: Image_path.person_image,
                //     ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
