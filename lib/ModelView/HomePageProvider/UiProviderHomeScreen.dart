import 'dart:io';

import 'package:doctifityapp/Model/Data/Model/DoctorModel.dart';
import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart';
import 'package:doctifityapp/Model/Data/Model/Hospital_Model.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';
import 'package:doctifityapp/Model/Repository/FireBaseFuncation/AuthFuncation.dart';
import 'package:doctifityapp/Model/Repository/FireBaseFuncation/FireStoreFuncations.dart';
import 'package:doctifityapp/Model/Repository/FireBaseFuncation/SupabseFuncations.dart';
import 'package:doctifityapp/ModelView/Auth/AuthProvider.dart';
import 'package:doctifityapp/utills/AppRoutes.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/Material.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, XFile, ImageSource;
import 'package:logger/web.dart';

class UiHomePageProvider extends ChangeNotifier{
  AuthFunction  authFunction = AuthFunction() ;
  AuthFunctionProvider authFunctionProvider = AuthFunctionProvider() ;
    UserModel user = UserModel.empty() ;
    List<Doctor> doctors = [] ;
    List<Hospital_Model> hospitals = [] ;
    List<Map<String,dynamic>> currentMedications = [] ;
    List<Map<String ,dynamic>> chronicConditions = [] ;
    List<String> allergiesAndSensitivities = [] ;

    void getUser(UserModel r) {
      user = UserModel(
        r.imageUrl,
        name: r.name,
        email: r.email,
        phoneNumber: r.phoneNumber,
        nationalId: r.nationalId,
        age: r.age,
        gender: r.gender,
        healthHistory: r.healthHistory,
        role: r.role,
        emergencyContact: r.emergencyContact,
        id: r.id, smoker: r.smoker, alcohol:r.alcohol,
        bloodType: r.bloodType,
        medecineList: r.medecineList,

      );
      print(r.medecineList);
      print(user.id) ;
      notifyListeners() ;
      print('==========================================');
      print(user.id) ;
      print(user.email) ;
      print(user.medecineList);
      getChronicConditions() ;
        getCurrentMedications() ;
    }
    void getDoctors(List<Doctor> r) {
      doctors.addAll(r) ;
      notifyListeners() ;
    }
    void getHospitals(List<Hospital_Model> r) {
      hospitals = r ;
      notifyListeners() ;
    }
    void addMedication(String medication) {
      currentMedications.add({'medication': medication});
      notifyListeners();
    }

    Future<void> uploadMedicalFiles(BuildContext context,String id) async {
      String url ;
      SupabaseFunctions supabaseFunctions = SupabaseFunctions();
      FireStoreFunction fireStoreFunction = FireStoreFunction();
      final ImagePicker _picker = ImagePicker();
      File? _selectedImage;
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        _selectedImage = File(image.path);
      url= await supabaseFunctions.uploadFile(file: _selectedImage, context: context) ;
        CustomSnackBar.showSuccess(context, 'File Picked ') ;
        final res = await fireStoreFunction.uplFiles(id: id, url: url) ;
        print(res) ;
        if(res== 'done'){
          CustomSnackBar.showSuccess(context, 'File Uploaded ') ;
        }else{
          CustomSnackBar.showError(context, 'File Not Uploaded ') ;
        }
      }
    }
    void logOut (context)async{
     final res = await authFunctionProvider.signOut(context) ;
     if (res == 'done'){
       CustomSnackBar.showSuccess(context, 'Logged Out ') ;
       Navigator.pushReplacementNamed(context, AppRoutes.loginScreen) ;
     }else{
       CustomSnackBar.showError(context, 'Not Logged Out ') ;
     }
    }
    void deleteMyAccount(context)async{
     final res=  await authFunction.deleteAccount() ;
     if (res == 'done'){
       CustomSnackBar.showSuccess(context, 'Account Deleted ') ;
       Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
     }else{
       CustomSnackBar.showError(context, res) ;
     }
    }
  void getChronicConditions() {
    try {
      chronicConditions.clear();
      allergiesAndSensitivities.clear();

      for (HealthRecord element in user.healthHistory) {
        final status = element.status.toLowerCase();

        if (status == 'chronic') {
          chronicConditions.add({
            'chronic': element.condition,
            'Treatment': element.treatment,
          });
        } else if (status == 'Allergies') {

          allergiesAndSensitivities.add(element.condition);

        }
      }

      print('Chronic conditions: $chronicConditions');
      notifyListeners();
    } catch (e) {
      print('Error getting chronic conditions: $e');
    }
  }
  void getCurrentMedications() {
         for (var medication in user.medecineList!) {
           currentMedications.add(medication);
           notifyListeners() ;
         }
  }



}