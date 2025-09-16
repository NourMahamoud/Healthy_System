import 'package:doctifityapp/ModelView/HomePageProvider/UiProviderHomeScreen.dart';
import 'package:doctifityapp/View/widgets/hospital_card.dart';
import 'package:doctifityapp/View/widgets/more_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HospitalsScreen extends StatefulWidget {
  const HospitalsScreen({super.key});

  @override
  State<HospitalsScreen> createState() => _MoreHospitalsState();
}

class _MoreHospitalsState extends State<HospitalsScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<UiHomePageProvider>();
    final screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Search Box
                         SizedBox(height: 20,),
                 Text('Hospitals',style: Theme.of(context).textTheme.titleLarge,),
             SizedBox(height: 10),
        
            // Hospitals List
            Consumer<UiHomePageProvider>(
              builder: (context,vm,child) {
                return Expanded(
                  child: vm.hospitals.isEmpty
                      ? Center(
                          child: Text(
                            "No hospitals found",
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: vm.hospitals.length,
                          itemBuilder: (context, index) {
                            return HospitalCard(
        hospital_model: vm.hospitals[index] ,
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
