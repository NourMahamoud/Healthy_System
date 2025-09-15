import 'package:flutter/material.dart';

class HospitalDoctorsCard extends StatelessWidget {
  final String name;
  final String email;
  final String specialization;
  final String phone;
  final String joinDate;

  const HospitalDoctorsCard({
    super.key,
    required this.name,
    required this.email,
    required this.specialization,
    required this.phone,
    required this.joinDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Color(0xFF42A5F5),
          child: Icon(Icons.person, color: Colors.white),
        ),
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(email),
            Text("Specialization: $specialization"),
            Text("Joined: $joinDate"),
          ],
        ),
        trailing: Text(
          phone,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}