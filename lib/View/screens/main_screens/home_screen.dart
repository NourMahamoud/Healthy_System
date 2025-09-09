import 'package:doctifityapp/View/screens/details_Screens/details.dart';
import 'package:doctifityapp/View/screens/details_Screens/more_doctors.dart';
import 'package:doctifityapp/View/screens/details_Screens/more_hospitals.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:doctifityapp/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utills/ColorCodes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            final user = value.user;
            return
            // user checking
            /*
            user == null
                ? const Text("Loading...")
                :
                */
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(Image_path().logo)),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // "${user.name} 👋",
                      "yossif 👋",
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      /* 
                            user.address,
                            */
                      "11 Al Laithi ST El Sharabia",
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            );
          },
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    // Notification tapped
                  },
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
                    // Arrow tapped
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Specialists
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Specialists",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                // Text Button Navigat to Doctors Page when we assgin as hospital
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MoreDoctors()),
                    );
                  },
                  child: vm.doctors.length == 1
                      ? Text("")
                      : Text("more...", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: vm.doctors.length,
                itemBuilder: (context, index) {
                  final doctor = vm.doctors[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Information(
                            name: doctor.name,
                            image: doctor.imageUrl,
                            active: true,
                            role: "doctor",
                            address: doctor.address,
                            email: doctor.email,
                            phone: doctor.phone,
                            specialty: doctor.specialty,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 100,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(doctor.imageUrl),
                          ),
                          SizedBox(height: 5),
                          Text(
                            doctor.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            doctor.specialty,
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // Vaccination Banner
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lightBlue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(Image_path().logo, width: 60),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Welcome to Doctify App",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Around You
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Around You",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MoreHospitals()),
                    );
                  },
                  child: vm.hospitals.length == 1
                      ? Text("")
                      : Text("More...", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Hospital List
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: vm.hospitals.length,
                itemBuilder: (context, index) {
                  final hospital = vm.hospitals[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // hospital image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              hospital.imageUrl,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12),

                          // hospital data
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hospital.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "${hospital.rating} (${hospital.reviews} reviews)",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                Text(
                                  "📍 ${hospital.location} ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 6),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Information(
                                          name: hospital.name,
                                          image: hospital.imageUrl,
                                          active: true,
                                          role: 'hospital',
                                          location: hospital.location,
                                          email: hospital.email,
                                          rating: hospital.rating,
                                          reviews: hospital.reviews,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 35,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: App_Colors.buttonColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Details",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Appointments",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "My Account",
          ),
        ],
      ),
    );
  }
}
