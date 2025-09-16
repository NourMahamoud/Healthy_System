import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart' hide HealthRecord;
import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../Model/Data/Model/HealthRecorde.dart';
import '../../ModelView/CompleteAcountProvider/HelperProviders/Custom_dialog_addDiseaseProider.dart';

class CustomMedicineDailogadd extends StatelessWidget {
  CustomMedicineDailogadd({super.key, required this.medicine, required this.dosage, required this.addMedications,});

  final TextEditingController medicine ;
  final TextEditingController dosage ;
  final VoidCallback addMedications;




  @override
  Widget build(BuildContext context) {

    return Container(
      width: 300,
      constraints: BoxConstraints(maxHeight: 400),
      decoration: BoxDecoration(
        color: App_Colors.offWhite,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.stethoscope,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Add Disease',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.lightBlue[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              padding: EdgeInsets.all(10),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Medicine'),
                  SizedBox(height: 5),
                  TextField(
                    controller:medicine ,
                    onTapOutside: (event) =>
                        FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      labelText: 'Medicine',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),

                  ),


                  Text('Dosage'),
                  TextField(
                    controller: dosage,
                    onTapOutside: (event) =>
                        FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      labelText: 'dosage',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),

                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                      SizedBox(width: 10),
                      TextButton(
                        onPressed: () async{
                          addMedications();
                          Navigator.of(context).pop();

                        } ,

                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              App_Colors.generalColor),
                        ),
                      ),
                    ],
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
