import 'package:doctifityapp/View/screens/details_Screens/details.dart';
import 'package:doctifityapp/View/screens/main_navigation.dart';
import 'package:doctifityapp/View/screens/main_screens/notification_screen.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:doctifityapp/view_model/home_view_model.dart';
import 'package:doctifityapp/view_model/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/get_QRCode.dart';
import '../../../utills/ColorCodes.dart';
import '../../widgets/healthRecord_Card.dart';
import 'doctors_screen.dart';
import 'hosoitals_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    // Responsive sizes
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double titleFont = screenWidth * 0.05; // ~18
    double subtitleFont = screenWidth * 0.04; // ~14
    double smallFont = screenWidth * 0.035; // ~12

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            final user = vm.users.first;
            return user == null
                ? Text("Loading...", style: TextStyle(fontSize: titleFont))
                : Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(user.imageUrl),
                        radius: screenWidth * 0.06,
                      ),
                      SizedBox(width: screenWidth * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${user.name} 👋",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: titleFont,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            user.address,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: smallFont,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Future.delayed(const Duration(milliseconds: 300), () {
                      context.read<NavigationViewModel>().setIndex(3);
                    });
                  },
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                    size: screenWidth * 0.06,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QRScreen(userId: '1'),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.black,
                    size: screenWidth * 0.06,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Health Records
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Health Records",
                  style: TextStyle(
                    fontSize: titleFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "All Records",
                    style: TextStyle(color: Colors.blue, fontSize: smallFont),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),

            SizedBox(
              height: screenHeight * 0.22,
              child: GridView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8,
                ),
                children: const [
                  HealthrecordCard(title: 'Covid Report', subtitle: 'Negative'),
                  HealthrecordCard(title: 'Blood Type', subtitle: 'AB+'),
                  HealthrecordCard(title: 'Blood pressure', subtitle: '120/80'),
                  HealthrecordCard(
                    title: 'Smoking Status',
                    subtitle: 'Non-smoker',
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Banner
            Container(
              height: screenHeight * 0.15,
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                color: Colors.lightBlue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Image.asset(Image_path().logo, width: screenWidth * 0.15),
                  SizedBox(width: screenWidth * 0.03),
                  Expanded(
                    child: Text(
                      "Welcome to Doctify App",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: titleFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            // Around You
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Around You",
                  style: TextStyle(
                    fontSize: titleFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HospitalsScreen(),
                      ),
                    );
                  },
                  child: vm.hospitals.length == 1
                      ? SizedBox.shrink()
                      : Text(
                          "More...",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: smallFont,
                          ),
                        ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),

            // Hospital List
            SizedBox(
              height: screenHeight * 0.45,
              child: ListView.builder(
                itemCount: vm.hospitals.length,
                itemBuilder: (context, index) {
                  final hospital = vm.hospitals[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: screenHeight * 0.015),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.035),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              hospital.imageUrl,
                              width: screenWidth * 0.15,
                              height: screenWidth * 0.15,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),

                          // Hospital Info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hospital.name,
                                  style: TextStyle(
                                    fontSize: titleFont,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: screenWidth * 0.04,
                                    ),
                                    SizedBox(width: screenWidth * 0.01),
                                    Text(
                                      "${hospital.rating} (${hospital.reviews} reviews)",
                                      style: TextStyle(fontSize: smallFont),
                                    ),
                                  ],
                                ),
                                Text(
                                  "📍 ${hospital.location}",
                                  style: TextStyle(
                                    fontSize: smallFont,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.01),
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
                                    height: screenHeight * 0.05,
                                    width: screenWidth * 0.5,
                                    decoration: BoxDecoration(
                                      color: App_Colors.buttonColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Details",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: subtitleFont,
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
    );
  }
}
