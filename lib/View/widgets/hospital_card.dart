import 'package:doctifityapp/Model/Data/Model/Hospital_Model.dart';
import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
final Hospital_Model hospital_model ;
  const HospitalCard({
  required this.hospital_model
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
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
                  ImagePath.hospitalBuilding,
                  width: screenWidth * 0.15,
                  height: screenWidth * 0.15,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: screenWidth * 0.04),

              Expanded(
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hospital_model.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                    Text(
                      "📍 ${hospital_model.address}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),


              Text(
                            hospital_model.phoneNumber,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: screenWidth * 0.04,
                            ),
                          )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
