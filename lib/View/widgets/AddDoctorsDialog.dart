import 'package:flutter/material.dart';

class AddDoctorDialog extends StatelessWidget {
  const AddDoctorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("➕ Add New Doctor"),
      content: SingleChildScrollView(
        child: Column(
          children: const [
            TextField(decoration: InputDecoration(labelText: "Full Name")),
            TextField(decoration: InputDecoration(labelText: "Specialization")),
            TextField(decoration: InputDecoration(labelText: "Email")),
            TextField(decoration: InputDecoration(labelText: "Phone Number")),
            TextField(decoration: InputDecoration(labelText: "Join Date")),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel" , style: TextStyle(color: Colors.blue),),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF42A5F5)),
          child: const Text("Add Doctor" , style: TextStyle(color: Colors.white),),
        ),
      ],
    );
  }
}