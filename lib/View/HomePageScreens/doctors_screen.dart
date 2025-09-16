import 'package:doctifityapp/ModelView/HomePageProvider/UiProviderHomeScreen.dart';
import 'package:doctifityapp/View/widgets/doctor_card.dart';
import 'package:doctifityapp/View/widgets/more_app_bar.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _MoreDoctorsState();
}

class _MoreDoctorsState extends State<DoctorsScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
             SizedBox(height: screenHeight * 0.02),
            Text('Doctors',style: Theme.of(context).textTheme.titleLarge,),
             SizedBox(height: screenHeight * 0.02),

            // Doctors List
            Consumer<UiHomePageProvider>(
              builder: (context, vm, child) {
                return Expanded(
                  child: vm.doctors.isEmpty
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
                          itemCount: vm.doctors.length,
                          itemBuilder: (context, index) {
                            return AnimatedSlide(
                              duration: const Duration(milliseconds: 300),
                              offset: Offset(0, 0),
                              curve: Curves.easeOut,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 400),
                                opacity: 1,
                                child: DoctorCard(
                                  vm.doctors[index]
                                ),
                              ),
                            );
                          },
                        ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
