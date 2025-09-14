import 'package:doctifityapp/View/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/home_view_model.dart';
import '../../widgets/more_app_bar.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _MoreDoctorsState();
}

class _MoreDoctorsState extends State<DoctorsScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;

    // فلترة الدكاترة حسب البحث
    final filteredDoctors = vm.doctors
        .where((doctor) =>
            doctor.name.toLowerCase().contains(query.toLowerCase()) ||
            doctor.specialty.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: MoreAppBar(
        title: Text(
          'Doctors',
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
                  hintText: "Search for doctors...",
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

          // Doctors List
          Expanded(
            child: filteredDoctors.isEmpty
                ? Center(
                    child: Text(
                      "No doctors found",
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = filteredDoctors[index];
                      return AnimatedSlide(
                        duration: const Duration(milliseconds: 300),
                        offset: Offset(0, 0),
                        curve: Curves.easeOut,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 400),
                          opacity: 1,
                          child: DoctorCard(
                            image: doctor.imageUrl,
                            name: doctor.name,
                            specialty: doctor.specialty,
                            onAdd: () {},
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
