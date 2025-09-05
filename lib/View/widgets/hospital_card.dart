import 'package:flutter/material.dart';

class HospitalCard extends StatelessWidget {
  final String image;
  final String name;
  final String? email;
  final double rating;
  final int reviews;
  final String location;

  const HospitalCard({
    super.key,
    required this.image,
    required this.name,
     this.email,
    required this.rating,
    required this.reviews,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                image,
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
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.05,
                    ),
                  ),

                  Text(
                    "$rating ($reviews reviews)",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),

                  Text(
                    "📍 $location",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),

                  email!=null ? Text(
                    email!,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.04,
                    ),
                  ): Text("Email Not Found") 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
