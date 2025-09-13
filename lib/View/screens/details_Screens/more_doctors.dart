import 'package:doctifityapp/View/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/home_view_model.dart';
import '../../widgets/more_app_bar.dart';

class MoreDoctors extends StatefulWidget {
  const MoreDoctors({super.key});

  @override
  State<MoreDoctors> createState() => _MoreDoctorsState();
}

class _MoreDoctorsState extends State<MoreDoctors> {
  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: MoreAppBar(title: Text('Doctors' , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold , fontSize: 20)), showBack: true),
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
              itemCount: vm.doctors.length,
              itemBuilder: (context, index) {
                final doctor = vm.doctors[index];
                return DoctorCard(
                  image: doctor.imageUrl,
                  name: doctor.name,
                  specialty: doctor.specialty,
                  onAdd: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
