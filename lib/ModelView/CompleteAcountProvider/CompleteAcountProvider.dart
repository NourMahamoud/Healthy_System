import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctifityapp/Model/Data/Model/DoctorModel.dart';
import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart';
import 'package:doctifityapp/Model/Repository/FireBaseFuncation/FireStoreFuncations.dart';
import 'package:doctifityapp/View/CompleteAccount/Custom_dialog_addDisease.dart';
import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';

class CompleteAccountProvider extends ChangeNotifier {
  // Role of the account (Doctor / Patient)
  final String rule;

  // Health Records (diseases, treatments, etc.)
  List<HealthRecord> _healthRecords = [];
  List<HealthRecord> get healthRecords => _healthRecords;

  // Gender options
  Set Gender = {'Female', 'Male'};

  // Account information
  final String email;
  final String id;
  final String name;

  // For menu handling
  final menuController = MenuController();

  // Allergies management
  late List _allergies;
  Set selected = {};

  // Controllers for form fields
  late final TextEditingController yourPhoneNumber;
  late final TextEditingController emergencyPhoneNumber;
  late final TextEditingController age;
  late final TextEditingController specialization;
  late final TextEditingController clinicAddress;
  late final TextEditingController clinicNumber;
  late final TextEditingController diagnosisDate;
  late final TextEditingController treatmentController;
  late final SearchController status;
  late final TextEditingController notesController;
  late final TextEditingController conditionController;

  // Options for blood type
  List bloodType = ['A+', 'A-', 'B+', 'B-', 'AB+', "AB-", 'O+', ' O-'];
  String blood = '';

  // Health-related booleans
  bool _doSurgery = false;
  bool _haveChronicDisease = false;
  bool _AdmittedBefore = false;
  bool _BloodTransBefore = false;
  bool _haveVirus = false;
  bool _smoke = false;

  // Allergies getter and setter
  set allergies(List value) {
    _allergies = value;
  }

  List get allergies => _allergies;

  // Gender selection (nullable string initially)
  String? selectedGender;

  void chooseGander(String? gender) {
    selectedGender = gender;
    notifyListeners();
  }

  // Add a new allergy via dialog
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

  // Constructor initializes controllers
  CompleteAccountProvider({
    required this.rule,
    required this.email,
    required this.name,
    required this.id,
  }) {
    _allergies = [];
    yourPhoneNumber = TextEditingController();
    emergencyPhoneNumber = TextEditingController();
    age = TextEditingController();
    specialization = TextEditingController();
    clinicAddress = TextEditingController();
    clinicNumber = TextEditingController();
    diagnosisDate = TextEditingController();
    treatmentController = TextEditingController();
    status = SearchController();
    notesController = TextEditingController();
    conditionController = TextEditingController();
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    yourPhoneNumber.dispose();
    emergencyPhoneNumber.dispose();
    age.dispose();
    specialization.dispose();
    clinicAddress.dispose();
    clinicNumber.dispose();
    super.dispose();
  }

  // Remove allergy by index
  void removeAllergy(int index) {
    _allergies.removeAt(index);
    notifyListeners();
  }

  // Setters for boolean health-related values
  set doSurgery(bool value) {
    _doSurgery = value;
    notifyListeners();
  }

  set haveChronicDisease(bool value) {
    _haveChronicDisease = value;
    notifyListeners();
  }

  set AdmittedBefore(bool value) {
    _AdmittedBefore = value;
    notifyListeners();
  }

  set BloodTransBefore(bool value) {
    _BloodTransBefore = value;
    notifyListeners();
  }

  set haveVirus(bool value) {
    _haveVirus = value;
    notifyListeners();
  }

  set smoke(bool value) {
    _smoke = value;
    notifyListeners();
  }

  // Select blood type
  void selectBloodType(String val) {
    blood = val;
    print(val);
    notifyListeners();
  }

  // Getters for boolean values
  bool get doSurgery => _doSurgery;
  bool get haveChronicDisease => _haveChronicDisease;
  bool get AdmittedBefore => _AdmittedBefore;
  bool get BloodTransBefore => _BloodTransBefore;
  bool get haveVirus => _haveVirus;
  bool get smoke => _smoke;

  // Save account data (Doctor or Patient) with error handling
  Future<void> saveData(BuildContext context) async {
    final response = FireStoreFunction();
    try {
      // Get existing data to preserve uploaded files
      final docRef = FirebaseFirestore.instance.collection("users").doc(id);
      final snapshot = await docRef.get();
      final existingData = snapshot.data() ?? {};

      Doctor doctor = Doctor(
        specialization: specialization.text,
        clinicAddress: clinicAddress.text,
        clinicNumber: clinicNumber.text,
        age: int.parse(age.text),
        name: name,
        email: email,
        phoneNumber: yourPhoneNumber.text,
        gender: selectedGender!,
        healthHistory: _healthRecords,
        role: rule,
        id: id,
        emergencyContact: emergencyPhoneNumber.text,
        nationalIdUrl: existingData["nationalIdUrl"],
      );

        await response.addUser(doctor, context);
      } else if (rule == 'Patient') {
        // Create Patient (User) model
        User user = User(
          role: rule,
          age: int.parse(age.text),
          emergencyContact: emergencyPhoneNumber.text,
          email: email,
          gender: selectedGender!,
          healthHistory: _healthRecords,
          name: name,
          phoneNumber: yourPhoneNumber.text,
          id: id,
          // preserve uploaded files
          nationalIdUrl: existingData["nationalIdUrl"],
          medicalFiles: List<String>.from(existingData["medicalFiles"] ?? []),
        );

        await response.addUser(user, context);
      }


    } catch (e) {
      CustomSnackBar.showError(context, 'Failed to save data: $e');
    }
  }







  // Setter for health records list
  set healthRecords(List<HealthRecord> value) {
    _healthRecords = value;
  }

  // Show dialog to add new health record
  void addHealthRecord(BuildContext context) {
    print('=====================================');
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: CustomDialogAddDisease(
            treatmentController: treatmentController,
            status: status,
            notesController: notesController,
            diagnosisDateController: diagnosisDate,
            conditionController: conditionController,
            addHealthRecord: () {
              addRecord(context);
            },
          ),
        );
      },
    );
  }

  // Actually add a health record to the list with error handling
  void addRecord(context) {
    try {
      HealthRecord record = HealthRecord(
        condition: conditionController.text,
        diagnosisDate: diagnosisDate.text,
        treatment: treatmentController.text,
        status: status.text,
        notes: notesController.text,
      );

      // Add record to local list
      _healthRecords.add(record);

      // Clear form fields
      conditionController.clear();
      diagnosisDate.clear();
      treatmentController.clear();
      status.clear();
      notesController.clear();

      print(_healthRecords.length);

      // Show success message
      CustomSnackBar.showSuccess(context, 'Health record added successfully');
      notifyListeners();
    } catch (e) {
      CustomSnackBar.showError(context, 'Failed to add record: $e');
    }
  }

  // Remove a health record by index
  void removeHealthRecord(int index) {
    _healthRecords.removeAt(index);
    notifyListeners();
  }

  Future<void> updateNationalIdUrl(BuildContext context, String url) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(id).set({
        "nationalIdUrl": url,
      }, SetOptions(merge: true));

      CustomSnackBar.showSuccess(context, "National ID uploaded successfully");
    } catch (e) {
      CustomSnackBar.showError(context, "Failed to update National ID: $e");
    }
  }


  Future<void> addMedicalFile(BuildContext context, String url) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(id).set({
        "medicalFiles": FieldValue.arrayUnion([url]),
      }, SetOptions(merge: true));

      CustomSnackBar.showSuccess(context, "Medical file added successfully");
    } catch (e) {
      CustomSnackBar.showError(context, "Failed to add medical file: $e");
    }
  }



}
