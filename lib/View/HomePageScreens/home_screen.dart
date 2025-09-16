import 'package:doctifityapp/ModelView/HomePageProvider/UiProviderHomeScreen.dart';
import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../utills/ImagePath.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double titleFont = screenWidth * 0.05;
    double subtitleFont = screenWidth * 0.04;
    double smallFont = screenWidth * 0.035;

    return Scaffold(
      body: Consumer<UiHomePageProvider>(
        builder: (context, uiProvider, child) {
          return SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User info section
                  Card(
                      color: App_Colors.offWhite,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:uiProvider.user.name=='' ? CircularProgressIndicator() : ListTile(
                        leading: CircleAvatar(
                          radius: 35,
                          backgroundImage: AssetImage(
                            uiProvider.user.gender == 'Male'
                                ? ImagePath.male
                                : ImagePath.female,
                          ),
                        ),
                        title: Text(
                          uiProvider.user.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoRow(
                                Icons.email, uiProvider.user.email, smallFont),
                            SizedBox(height: 4),
                            _buildInfoRow(
                                Icons.cake, uiProvider.user.age.toString(),
                                smallFont),
                            SizedBox(height: 4),
                            _buildInfoRow(
                                Icons.phone, uiProvider.user.phoneNumber,
                                smallFont),
                            SizedBox(height: 4),
                            _buildInfoRow(
                                uiProvider.user.gender.toLowerCase() == 'male'
                                    ? Icons.male
                                    : Icons.female,
                                uiProvider.user.gender,
                                smallFont
                            ),


                          ],
                        ),

                      )),
                  SizedBox(height: screenHeight * 0.02),
                  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),

                      ),
                      color: App_Colors.offWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Current Medications', style: Theme
                                    .of(context)
                                    .textTheme
                                    .displayLarge,),
                                Spacer(),
                                IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.01),
                            Visibility(
                              visible: uiProvider.currentMedications.isNotEmpty,
                              child: SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: GridView.builder(

                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: uiProvider.currentMedications.length,
                                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 150,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      mainAxisExtent: 300,
                                      childAspectRatio: 1.5
                                  ),
                                  itemBuilder: (BuildContext context,index){
                                    return Card(
                                      color: App_Colors.lightBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListTile(
                                        leading: Icon(FontAwesomeIcons.capsules, color: Colors.blue),
                                        title: Text(uiProvider.currentMedications[index]['medicine'],style: TextStyle(color: Colors.white,fontSize: 20),),
                                        subtitle: Text(uiProvider.currentMedications[index]['dosage']),
                                      )

                                    ) ;
                                  },),
                              ),
                            )

                          ],
                        ),

                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                     Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),) ,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              Text('Chronic Conditions', style: Theme
                                  .of(context)
                                  .textTheme
                                  .displayLarge,),
                              Spacer(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add))
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: uiProvider.chronicConditions.length,
                            itemBuilder: (context,index) {
                              return Card(
                                color: App_Colors.offWhite,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: ListTile(
                                      leading: Icon(Icons.favorite_border,color: Colors.blue,),
                                  title: Text(uiProvider.chronicConditions[index]["chronic"]),
                                  subtitle: Text(uiProvider.chronicConditions[index]['Treatment']),
                                )
                              );
                            }
                          )

                        ],


                    ),
                  )) ,

                     Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),) ,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              Text('Allergies & Sensitivities', style: Theme
                                  .of(context)
                                  .textTheme
                                  .displayLarge,),
                              Spacer(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add))
                            ],
                          ),

                          SizedBox(height: screenHeight * 0.01),
                          ListView.separated(
                            padding: EdgeInsets.all(12),
                            shrinkWrap: true,
                            itemCount: uiProvider.allergiesAndSensitivities.length,
                            itemBuilder: (context,index) {
                              return Card(
                                color: Colors.red[100],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: ListTile(
                                  title: Text(uiProvider.allergiesAndSensitivities[index]),
                                  leading: Icon(  Icons.warning_amber_outlined,
                                    color: Colors.red,),
                                ),
                              ) ;
                            }, separatorBuilder: (BuildContext context, int index) {
                              return SizedBox(height: 10,) ;

                          },
                          )

                        ],

                      ),
                    ),
                  ),



                  // Banner
                  SizedBox(height: screenHeight * 0.02),

                  // Around You
                  SizedBox(height: screenHeight * 0.01),
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.04),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quick Actions',
                          style: Theme
                              .of(context)
                              .textTheme
                              .displayLarge,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Card(

                          color: App_Colors.offWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.qr_code,
                              color: Colors.blueAccent,
                            ),
                            onTap: () {},
                            title: const Text('Get QR Code'),
                          ),
                        ),
                        Card(
                          color: App_Colors.offWhite,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.file_copy_outlined,
                              color: Colors.blueAccent,
                            ),

                            onTap: () {
                              uiProvider.uploadMedicalFiles(context, uiProvider.user.id!) ;
                            },
                            title: const Text('Add Rumors and analyses'),
                          ),
                        ),
                        Card(
                          color: App_Colors.offWhite,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: const Icon(
                              FontAwesomeIcons.stethoscope,
                              color: Colors.blueAccent,
                            ),

                            onTap: () {},
                            title: const Text('Add Health Recorder'),
                          ),
                        ),

                      ],
                    ),
                  ),

                  // Hospital List (commented out)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text, double fontSize) {
    return Row(
      children: [
        Icon(icon, size: fontSize, color: Colors.grey),
        SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(
            color: Colors.lightBlue,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
