import 'package:doctifityapp/View/hospital_screens/PatiantSearchScreen.dart';
import 'package:doctifityapp/View/widgets/AddDoctorsDialog.dart';
import 'package:doctifityapp/View/widgets/hospitalDoctorsCard.dart';
import 'package:doctifityapp/View/widgets/patiantCard.dart';
import 'package:flutter/material.dart';

import '../widgets/hospitalStatCard.dart';

class HospitalDashboardScreen extends StatelessWidget {
  const HospitalDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const friendlyBlue = Color(0xFF64B5F6); // A friendly blue color

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: friendlyBlue,
        foregroundColor: Colors.white,
        title: const Text("🏥 Medical Records System"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.local_hospital, color: Colors.white,),
            onPressed: () {},
            tooltip: "Hospital Dashboard",
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PatientSearchScreen()),
              );
            },
            tooltip: "Search Patients",
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🏥 Hospital Info Card
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Central Medical Hospital",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Hospital Management Dashboard",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),

                  const Divider(height: 24),

                  Row(
                    children: const [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "123 Healthcare Ave, Medical District, MD 12345",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: const [
                      Icon(Icons.phone, color: Colors.blue),
                      SizedBox(width: 8),
                      Expanded(child: Text("+1-555-HOSPITAL")),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: const [
                      Icon(Icons.email, color: Colors.orange),
                      SizedBox(width: 8),
                      Expanded(child: Text("info@centralmedical.com")),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: const [
                      Icon(Icons.calendar_month, color: Colors.green),
                      SizedBox(width: 8),
                      Expanded(child: Text("Established 1985")),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // 📊 Stats Section
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    children: const [
                      StatCard(
                        label: "Total Beds",
                        value: "350",
                        icon: Icons.bed,
                      ),
                      StatCard(
                        label: "Doctors",
                        value: "35",
                        icon: Icons.person,
                      ),
                      StatCard(
                        label: "Patients",
                        value: "1247",
                        icon: Icons.group,
                      ),
                      StatCard(
                        label: "Occupancy",
                        value: "98%",
                        icon: Icons.show_chart,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Medical Staff Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "👩‍⚕️ Medical Staff",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add Doctor"),
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF64B5D9),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const AddDoctorDialog(),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 12),

          const HospitalDoctorsCard(
            name: "Dr. Sarah Johnson",
            email: "sarah.johnson@hospital.com",
            specialization: "Cardiology",
            phone: "+1-555-0123",
            joinDate: "2020-03-15",
          ),
          const HospitalDoctorsCard(
            name: "Dr. Michael Chen",
            email: "michael.chen@hospital.com",
            specialization: "Neurology",
            phone: "+1-555-0124",
            joinDate: "2019-07-22",
          ),
        ],
      ),
    );
  }
}






