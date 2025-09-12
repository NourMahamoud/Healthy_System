import 'package:flutter/material.dart';

import '../../Model/Data/Model/DoctorModel.dart';
import '../../utills/CustomWidget/CardWidget.dart';
import '../../utills/CustomWidget/custom_bottom_nav_bar.dart';

class Specialists extends StatefulWidget {
  const Specialists({super.key});

  @override
  State<Specialists> createState() => _SpecialistsState();
}

// Dummy data for doctors, will be change
final List<Doctor> doctors = [
  Doctor(
    specialization: "Cardiologist",
    clinicAddress: "123 Main Street",
    clinicNumber: "C101",
    age: 45,
    name: "Dr. Ahmed Hassan",
    email: "ahmed.hassan@example.com",
    phoneNumber: "01012345678",
    gender: "Male",
    healthHistory: [],
    role: "doctor",
    id: "D1",
    emergencyContact: "01098765432",
    nationalIdUrl: "assets/images/national_id.png",
    availabilityStartTime: "09:00 AM",
    availabilityEndTime: "03:00 PM",
  ),
  Doctor(
    specialization: "Cardiologist",
    clinicAddress: "123 Main Street",
    clinicNumber: "C101",
    age: 45,
    name: "Dr. Ahmed Hassan",
    email: "ahmed.hassan@example.com",
    phoneNumber: "01012345678",
    gender: "Male",
    healthHistory: [],
    role: "doctor",
    id: "D1",
    emergencyContact: "01098765432",
    nationalIdUrl: "assets/images/national_id.png",
    availabilityStartTime: "09:00 AM",
    availabilityEndTime: "03:00 PM",
  ),
  Doctor(
    specialization: "Cardiologist",
    clinicAddress: "123 Main Street",
    clinicNumber: "C101",
    age: 45,
    name: "Dr. Ahmed Hassan",
    email: "ahmed.hassan@example.com",
    phoneNumber: "01012345678",
    gender: "Male",
    healthHistory: [],
    role: "doctor",
    id: "D1",
    emergencyContact: "01098765432",
    nationalIdUrl: "assets/images/national_id.png",
    availabilityStartTime: "09:00 AM",
    availabilityEndTime: "03:00 PM",
  ),
  Doctor(
    specialization: "Cardiologist",
    clinicAddress: "123 Main Street",
    clinicNumber: "C101",
    age: 45,
    name: "Dr. Ahmed Hassan",
    email: "ahmed.hassan@example.com",
    phoneNumber: "01012345678",
    gender: "Male",
    healthHistory: [],
    role: "doctor",
    id: "D1",
    emergencyContact: "01098765432",
    nationalIdUrl: "assets/images/national_id.png",
    availabilityStartTime: "09:00 AM",
    availabilityEndTime: "03:00 PM",
  ),
  Doctor(
    specialization: "Cardiologist",
    clinicAddress: "123 Main Street",
    clinicNumber: "C101",
    age: 45,
    name: "Dr. Ahmed Hassan",
    email: "ahmed.hassan@example.com",
    phoneNumber: "01012345678",
    gender: "Male",
    healthHistory: [],
    role: "doctor",
    id: "D1",
    emergencyContact: "01098765432",
    nationalIdUrl: "assets/images/national_id.png",
    availabilityStartTime: "09:00 AM",
    availabilityEndTime: "03:00 PM",
  ),
  Doctor(
    specialization: "Dermatologist",
    clinicAddress: "45 Nile Avenue",
    clinicNumber: "C102",
    age: 38,
    name: "Dr. Sara Ali",
    email: "sara.ali@example.com",
    phoneNumber: "01087654321",
    gender: "Female",
    healthHistory: [],
    role: "doctor",
    id: "D2",
    emergencyContact: "01011223344",
    nationalIdUrl: "assets/images/national_id.png",
    availabilityStartTime: "11:00 AM",
    availabilityEndTime: "06:00 PM",
  ),
];

class _SpecialistsState extends State<Specialists> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 60,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text(
            '515 AlWaleed Bin Talal Street, Maadi',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          centerTitle: false,
          actionsPadding: EdgeInsets.only(right: 26),
          actions: [
            Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 24,
              color: Colors.grey,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Specialists',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: ListView.builder(
                      itemCount: doctors.length,
                      itemBuilder: (context, index) =>
                          CardWidget(doctor: doctors[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
