import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final String name;
  final String id;
  final String lastVisit;

  const PatientCard({
    super.key,
    required this.name,
    required this.id,
    required this.lastVisit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text("ID: $id", style: const TextStyle(color: Colors.black54)),
          Text(
            "Last visit: $lastVisit",
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
