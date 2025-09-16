import 'package:doctifityapp/Model/Data/Model/DoctorModel.dart';
import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard( this.doctor,);
  final Doctor doctor ;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: App_Colors.offWhite,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                doctor.gender == 'Male' ? ImagePath.male : ImagePath.female,
                width: screenWidth * 0.15,
                height: screenWidth * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: screenWidth * 0.04),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),
                  Text(
                    doctor.specialization,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  Text(
                    doctor.clinic_nunmber,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  Text(
                    doctor.clinic_address,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
