import 'package:doctifityapp/View/widgets/more_app_bar.dart';
import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final String name;
  final String? email;
  final String? phone;
  final String image;
  final String? address;
  final String? age;
  final String? specialty;
  final String? location;
  final int? reviews;
  final double? rating;
  final bool active;
  final String role;

  const Information({
    super.key,
    required this.name,
    this.specialty,
    this.address,
    this.age,
    this.email,
    required this.image,
    required this.active,
    this.phone,
    required this.role,
    this.location,
    this.reviews,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: MoreAppBar(title: "Details", showBack: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile container
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        image,
                        height: screenHeight * 0.2,
                        width: screenWidth * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: active ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        active ? "Active $role" : "Non active $role",
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),
              const Text(
                "More Information",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              role == "doctor" ? _doctorInfo() : _hospitalInfo(),
            ],
          ),
        ),
      ),
    );
  }

  // Doctor Info Widget
  Widget _doctorInfo() {
    return Center(
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Personal Information",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            _infoRow(
              icon: Icons.person_outline,
              title: "Full Name",
              value: "Dr. $name",
            ),
            const Divider(height: 30),

            _infoRow(
              icon: Icons.email_outlined,
              title: "Email Address",
              value: email ?? "No email",
            ),
            const Divider(height: 30),

            _infoRow(
              icon: Icons.phone_outlined,
              title: "Phone Number",
              value: phone ?? "No phone",
            ),
            const Divider(height: 30),

            _infoRow(
              icon: Icons.medical_information,
              title: "Specialty",
              value: specialty ?? "Unknown",
            ),
          ],
        ),
      ),
    );
  }

  // Hospital Info Widget
  Widget _hospitalInfo() {
    return Center(
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hospital Information",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            _infoRow(
              icon: Icons.location_on_outlined,
              title: "Location",
              value: location ?? "Unknown",
            ),
            const Divider(height: 30),

            _infoRow(
              icon: Icons.email_outlined,
              title: "Email Address",
              value: email ?? "No email",
            ),
            const Divider(height: 30),

            _infoRow(
              icon: Icons.phone_outlined,
              title: "Phone Number",
              value: phone ?? "No phone",
            ),
            const Divider(height: 30),

            _infoRow(
              icon: Icons.star_rate_outlined,
              title: "Rating & Reviews",
              value: "${rating ?? 0} (${reviews ?? 0} reviews)",
            ),
          ],
        ),
      ),
    );
  }

  // reusable info row
  Widget _infoRow({
    required IconData icon,
    required String title,
    required String value,
    Widget? trailing,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
        if (trailing != null) trailing,
      ],
    );
  }
}
