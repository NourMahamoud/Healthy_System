import 'package:doctifityapp/Model/Data/Model/DoctorModel.dart';
import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class  CompleteAccountProvider extends ChangeNotifier {
  final String  rule  ;
  List<HealthRecord> _healthRecords = [];
  List<HealthRecord> get healthRecords => _healthRecords;
  Set Gender = { 'Female', 'Male' } ;
  final  String email ;
  final String name ;
  final menuController = MenuController();
  late List _allergies ;
   Set  selected =  {};
   late final TextEditingController  yourPhoneNumber ;
   late final  TextEditingController emergencyPhoneNumber ;
   List bloodType = ['A+', 'A-', 'B+', 'B-', 'AB+',"AB-",'O+',' O-'];
   String blood  = '';
   late final TextEditingController age ;
   late final TextEditingController  nameofSurgery ;
   late final TextEditingController chronicDisease ;
   late final TextEditingController reasonOfAdmitted;
   late final TextEditingController dateOfBloodTrans ;
   late final TextEditingController virusName;
   late final TextEditingController smokeDate ;
   late final TextEditingController specialization ;
   late final TextEditingController clinicAddress  ;
   late final TextEditingController clinicNumber  ;
   bool  _doSurgery = false;
   bool  _haveChronicDisease = false;
   bool  _AdmittedBefore = false;
   bool  _BloodTransBefore = false;
   bool _haveVirus = false ;
   bool _smoke = false ;

  set allergies(List value) {
    _allergies = value;
  }

  List get allergies => _allergies;

  String? selectedGender; // Use String? to allow null initially

  void chooseGander(String? gender) {
    selectedGender = gender;
    notifyListeners();
  }
  void addAllergy(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newAllergy = '';
        return AlertDialog(
          title: const Text('Add Allergy'),
          content: TextField(
            onChanged: (value) {
              newAllergy = value;
            },
            decoration: const InputDecoration(hintText: 'Enter allergy name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newAllergy.isNotEmpty) {
                    _allergies.add(newAllergy);
                    notifyListeners();
                }
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  CompleteAccountProvider({required  this.rule, required this.email, required this.name}){
    _allergies = [];
    yourPhoneNumber = TextEditingController();
    emergencyPhoneNumber = TextEditingController();
    age = TextEditingController();
    nameofSurgery = TextEditingController();
    chronicDisease = TextEditingController();
    reasonOfAdmitted = TextEditingController();
    dateOfBloodTrans = TextEditingController();
    virusName = TextEditingController();
    smokeDate = TextEditingController();
    specialization = TextEditingController();
    clinicAddress = TextEditingController();
    clinicNumber = TextEditingController();
  }
  @override
  void dispose() {
    yourPhoneNumber.dispose();
    emergencyPhoneNumber.dispose();
    age.dispose();
    nameofSurgery.dispose();
    chronicDisease.dispose();
    reasonOfAdmitted.dispose();
    dateOfBloodTrans.dispose();
    virusName.dispose();
    smokeDate.dispose();
    specialization.dispose();
    clinicAddress.dispose();
    clinicNumber.dispose();
    super.dispose();
  }


  void removeAllergy(int index) {
    _allergies.removeAt(index);
    notifyListeners();

  }

  set doSurgery(bool value) {
    _doSurgery = value;
    notifyListeners() ;

  }

  set haveChronicDisease(bool value) {
    _haveChronicDisease = value;
    notifyListeners() ;

  }

  set AdmittedBefore(bool value) {
    _AdmittedBefore = value;
    notifyListeners() ;

  }

  set BloodTransBefore(bool value) {
    _BloodTransBefore = value;
    notifyListeners() ;

  }

  set haveVirus(bool value) {
    _haveVirus = value;
    notifyListeners() ;

  }

  set smoke(bool value) {
    _smoke = value;
    notifyListeners() ;
  }
  void selectBloodType (String val ){
    blood = val ;
    print(val) ;
    notifyListeners() ;
  }

  bool get doSurgery => _doSurgery;

  bool get haveChronicDisease => _haveChronicDisease;

  bool get AdmittedBefore => _AdmittedBefore;

  bool get BloodTransBefore => _BloodTransBefore;

  bool get haveVirus => _haveVirus;

  bool get smoke => _smoke;

  void saveData() {
    if (rule == 'Doctor'){
     Doctor doctor = Doctor(specialization.text, clinicAddress.text, clinicNumber.text, age: int.parse(age.text), name:name , email: email, phoneNumber:yourPhoneNumber.text , nationalId: 'nationalId', gender: '', healthHistory: [], role: 'role', id: 'id', emergencyContact: 'emergencyContact') ;
    }  else if  (rule == 'Patient'){

    }
  }
  void addHealthRecord(BuildContext context) {
    String condition = '';
    DateTime diagnosisDate = DateTime.now();
    String treatment = '';
    String status = 'active';
    String? notes;

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text('Add Health Record'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Condition'),
                  onChanged: (val) => condition = val,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Treatment'),
                  onChanged: (val) => treatment = val,
                ),
                DropdownButton<String>(
                  value: status,
                  items: ['active', 'recovered', 'chronic']
                      .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                      .toList(),
                  onChanged: (val) => status = val!,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Notes'),
                  onChanged: (val) => notes = val,
                ),
                // You can also add a date picker for diagnosisDate
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                HealthRecord record = HealthRecord(
                  condition: condition,
                  diagnosisDate: diagnosisDate,
                  treatment: treatment,
                  status: status,
                  notes: notes,
                );
                addHealthRecordToProvider(record);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


  void addHealthRecordToProvider(HealthRecord record) {
    _healthRecords.add(record);
    notifyListeners();
  }

  void removeHealthRecord(int index) {
    _healthRecords.removeAt(index);
    notifyListeners();
  }



}