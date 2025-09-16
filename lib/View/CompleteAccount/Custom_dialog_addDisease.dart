import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart' hide HealthRecord;
import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../Model/Data/Model/HealthRecorde.dart';
import '../../ModelView/CompleteAcountProvider/HelperProviders/Custom_dialog_addDiseaseProider.dart';

class CustomDialogAddDisease extends StatelessWidget {
   CustomDialogAddDisease({super.key, required this.conditionController, required this.diagnosisDateController, required this.treatmentController, required this.status, required this.notesController, required this.addHealthRecord});

final TextEditingController conditionController ;
final TextEditingController diagnosisDateController ;
final TextEditingController treatmentController ;
final SearchController status ;
final TextEditingController notesController ;
   final VoidCallback addHealthRecord;
  DateTime _diagnosisDate = DateTime.now();

void _dataPicker (context)async{
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),

  );
  if (pickedDate != null) {
    _diagnosisDate = pickedDate;
    diagnosisDateController.text = '${_diagnosisDate.day}/${_diagnosisDate.month}/${_diagnosisDate.year}';
  }
}

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
                  Text('Condition'),
                  SizedBox(height: 5),
                  TextField(
                    controller: conditionController,
                    onTapOutside: (event) =>
                        FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      labelText: 'Condition',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),

                  ),
                  Text('Diagnosis Date'),
                  TextField(
                    controller: diagnosisDateController,
                    onTapOutside: (event) =>
                        FocusScope.of(context).unfocus(),
                    onTap: (){
                      _dataPicker(context);

                    },


                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today, color: Colors.blue), // Diagnosis Date
                      labelText: 'Diagnosis Date',
                      hintText: 'mm/dd/yyyy',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),

                  ),

                  Text('Treatment'),
                  TextField(
                    controller: treatmentController,
                    onTapOutside: (event) =>
                        FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      labelText: 'Treatment',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),

                  ),
                  SizedBox(height: 15),
                  Text('Status'),
                  SizedBox(height: 5),
                  SearchAnchor(
                     searchController: status,
                    viewLeading: FaIcon(FontAwesomeIcons.heartbeat),
                    viewBackgroundColor: Colors.white,

                      viewHintText: 'Status',
                      builder: (BuildContext context, SearchController controller){
                    return SearchBar(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.black,width: 1))),
                      backgroundColor: WidgetStatePropertyAll(App_Colors.offWhite),
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      elevation: WidgetStatePropertyAll(0),
                      controller: controller,
                      leading:FaIcon(FontAwesomeIcons.heartbeat),
                      onTap: (){
                        controller.openView();
                      },
                      hintText: 'Status',
                    ) ;

                  }, suggestionsBuilder: (BuildContext context, SearchController controller){
                    return ['active', 'Treatment', 'chronic','Allergies'].map((s)=>ListTile(title: Text(s),onTap: (){
                      controller.closeView(s);
                    },)).toList() ;

                  }) ,
                  SizedBox(height: 15),
                  Text('Notes (optional)'),
                  SizedBox(height: 5),
                  TextField(
                    controller: notesController,
                    onTapOutside: (event) =>
                        FocusScope.of(context).unfocus(),
                    maxLines: 4,
                    decoration: InputDecoration(
                      labelText: 'Notes',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.grey,
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
                              addHealthRecord();
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
