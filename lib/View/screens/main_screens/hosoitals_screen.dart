import 'package:doctifityapp/View/widgets/hospital_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/home_view_model.dart';
import '../../widgets/more_app_bar.dart';

class HospitalsScreen extends StatefulWidget {
  const HospitalsScreen({super.key});

  @override
  State<HospitalsScreen> createState() => _MoreHospitalsState();
}

class _MoreHospitalsState extends State<HospitalsScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;

    // فلترة المستشفيات حسب البحث
    final filteredHospitals = vm.hospitals.where((hospital) {
      final matchesQuery = hospital.name.toLowerCase().contains(query.toLowerCase()) ||
          hospital.location.toLowerCase().contains(query.toLowerCase());
      return matchesQuery;
    }).toList();

    return Scaffold(
      appBar: MoreAppBar(
        title: Text(
          'Hospitals',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.055,
          ),
        ),
        showBack: false,
      ),
      body: Column(
        children: [
          // Search Box
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                onChanged: (value) => setState(() => query = value),
                cursorColor: Colors.blue,
                style: TextStyle(fontSize: screenWidth * 0.045),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.04,
                    horizontal: screenWidth * 0.05,
                  ),
                  hintText: "Search for hospitals...",
                  hintStyle: TextStyle(
                    fontSize: screenWidth * 0.04,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.all(screenWidth * 0.02),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Hospitals List
          Expanded(
            child: filteredHospitals.isEmpty
                ? Center(
                    child: Text(
                      "No hospitals found",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredHospitals.length,
                    itemBuilder: (context, index) {
                      final hospital = filteredHospitals[index];
                      return HospitalCard(
                        image: hospital.imageUrl,
                        name: hospital.name,
                        email: hospital.email,
                        rating: hospital.rating,
                        reviews: hospital.reviews,
                        location: hospital.location,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
