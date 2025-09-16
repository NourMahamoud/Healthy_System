import 'package:doctifityapp/Model/Data/Model/DoctorModel.dart';
import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';
import 'package:doctifityapp/Model/Repository/FireBaseFuncation/FireStoreFuncations.dart';
import 'package:doctifityapp/View/CompleteAccount/Custom_dialog_addDisease.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:doctifityapp/View/CompleteAccount/CustomMedicineListDailogAdd.dart';

class CompleteAccountProvider extends ChangeNotifier {
  // Health Records (diseases, treatments, etc.)
  List<HealthRecord> _healthRecords = [];

  List<HealthRecord> get healthRecords => _healthRecords;

  Set Gender = {'Female', 'Male'};

  // Account information
  final String email;
  final String id;
  final String name;
  final String rule;

  // For menu handling
  final menuController = MenuController();

  // Allergies management
  late List <Map<String, dynamic>>_medicineList;
  Set selected = {};

  set alachol(bool value) {
    _alachol = value;
  }

  List<Map<String, dynamic>> get medicineList =>
      _medicineList;

  set medicineList(List<Map<String, dynamic>> value) {
    _medicineList = value;
  } // Controllers for form fields
  late final TextEditingController yourPhoneNumber;
  late final TextEditingController nationalId;
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
  late final TextEditingController medicine;
  late final TextEditingController dosage;

  // Options for blood type
  List bloodType = ['A+', 'A-', 'B+', 'B-', 'AB+', "AB-", 'O+', ' O-'];
  String blood = '';

  // Health-related booleans
  bool _alachol = false;
  bool _haveChronicDisease = false;
  bool _AdmittedBefore = false;
  bool _BloodTransBefore = false;
  bool _haveVirus = false;
  bool _smoke = false;




  // Gender selection (nullable string initially)
  String? selectedGender;

  void chooseGander(String? gender) {
    selectedGender = gender;
    notifyListeners();
  }

  // Add a new allergy via dialog

  // Constructor initializes controllers
  CompleteAccountProvider({
    required this.rule,
    required this.email,
    required this.name,
    required this.id,
  }) {
    _medicineList = [];
    yourPhoneNumber = TextEditingController();
    emergencyPhoneNumber = TextEditingController();
    age = TextEditingController();
    specialization = TextEditingController();
    clinicAddress = TextEditingController();
    clinicNumber = TextEditingController();
    nationalId = TextEditingController();
    diagnosisDate = TextEditingController();
    treatmentController = TextEditingController();
    status = SearchController();
    notesController = TextEditingController();
    conditionController = TextEditingController();
    medicine = TextEditingController();
    dosage = TextEditingController();
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
    nationalId.dispose();
    diagnosisDate.dispose();
    treatmentController.dispose();
    status.dispose();
    notesController.dispose();
    conditionController.dispose();
    medicine.dispose();
    dosage.dispose();

    super.dispose();
  }

  // Remove removeHealthRecorder by index
  void removeHealthRecorder(int index) {
    healthRecords.removeAt(index);
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
  bool get alchol => _alachol;
  bool get smoke => _smoke;

  // Save account data (Doctor or Patient) with error handling
  Future<void> saveData(context) async {
    final response = FireStoreFunction();
    try {
      if (rule == 'Doctor') {
        // Create Doctor model
        Doctor doctor = Doctor(
          '',
          specialization.text,

          clinicAddress.text,
          clinicNumber.text,
          age: int.parse(age.text),
          name: name,
          email: email,
          phoneNumber: yourPhoneNumber.text,
          nationalId: nationalId.text,
          gender: selectedGender!,
          healthHistory: _healthRecords,
          role: rule,
          id: id,
          emergencyContact: emergencyPhoneNumber.text,
          smoker: smoke ? 'Smoker' : 'Non-Smoker',
          alcohol: _alachol ? 'Alcoholic' : 'Non-Alcoholic',
          bloodType: blood,
          medecineList: _medicineList,
        );

        await response.addDoctor(doctor, context);
      } else if (rule == 'Patient') {
        // Create Patient (User) model
        UserModel user = UserModel(
          'null',
          role: rule,
          age: int.parse(age.text),
          emergencyContact: emergencyPhoneNumber.text,
          email: email,
          gender: selectedGender!,
          healthHistory: _healthRecords,
          name: name,
          nationalId: nationalId.text,
          phoneNumber: yourPhoneNumber.text,
          id: id,
          smoker: smoke ? 'Smoker' : 'Non-Smoker',
          alcohol: _alachol ? 'Alcoholic' : 'Non-Alcoholic',
          bloodType: blood,
          medecineList: _medicineList,
        );
        await response.addUser(user, context);
      }

      CustomSnackBar.showSuccess(context, 'Data saved successfully');
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
  }void addMedicine(BuildContext context) {
    print('=====================================');
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: CustomMedicineDailogadd(
            addMedications:(){
              if (medicine.text.isNotEmpty && dosage.text.isNotEmpty) {
                _medicineList.add({
                  'medicine': medicine.text,
                  'dosage': dosage.text,
                });
              }
            } ,
            dosage:dosage ,
            medicine:  medicine,
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
  void removeMedicine(int index) {
      _medicineList.removeAt(index);
    notifyListeners();
  }
}
