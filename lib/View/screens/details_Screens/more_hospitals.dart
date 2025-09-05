import 'package:doctifityapp/View/widgets/hospital_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/home_view_model.dart';
import '../../widgets/more_app_bar.dart';

class MoreHospitals extends StatefulWidget {
  const MoreHospitals({super.key});

  @override
  State<MoreHospitals> createState() => _MoreHospitalsState();
}

class _MoreHospitalsState extends State<MoreHospitals> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: MoreAppBar(title: 'Hospitals', showBack: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.2),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.name,
                cursorColor: Colors.lightBlue,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic,
                  ),
                  suffixIcon: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
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
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: vm.hospitals.length,
              itemBuilder: (context, index) {
                final hospital = vm.hospitals[index];
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
