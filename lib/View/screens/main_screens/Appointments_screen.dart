import 'package:doctifityapp/View/screens/main_navigation.dart';
import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Appointments", style: TextStyle(fontSize: 50))),
    );
  }
}
