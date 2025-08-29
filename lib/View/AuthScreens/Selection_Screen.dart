import 'package:flutter/material.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          child:SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/Images/logo.png',height: 50,),
                  Text('') ,
                ],
              )

              ],),
          ),
        ),
      ),
    );
  }
}
