import 'package:doctifityapp/View/widgets/patiantCard.dart';
import 'package:flutter/material.dart';

class PatientSearchScreen extends StatelessWidget {
  const PatientSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("🔍 Patient Search"),
        backgroundColor: Color(0xFF64B5F6),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Enter National ID",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Quick Search",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                PatientCard(
                  name: "John Anderson",
                  id: "123456789",
                  lastVisit: "2024-08-20",
                ),
                PatientCard(
                  name: "Maria Garcia",
                  id: "987654321",
                  lastVisit: "2024-09-10",
                ),
                PatientCard(
                  name: "Robert Smith",
                  id: "456789123",
                  lastVisit: "2024-09-05",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


