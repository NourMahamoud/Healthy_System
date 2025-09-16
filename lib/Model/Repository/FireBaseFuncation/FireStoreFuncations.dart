import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctifityapp/Model/Data/Model/DoctorModel.dart';
import 'package:doctifityapp/Model/Data/Model/Hospital_Model.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';
import 'package:doctifityapp/utills/AppRoutes.dart';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/Material.dart';

class FireStoreFunction {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference medicalFiles = FirebaseFirestore.instance.collection('medicalFiles');
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future  addUser(UserModel user,  context) async {
    try {
      final response = await users.doc(user.id).set(user.toJson());
      CustomSnackBar.showSuccess(context, 'User added successfully');
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen,arguments: {
        'id' : user.id ,
      });
    } on FirebaseException catch (e) {
      ErrorHandler.handleFireStoreError(context, e.code);
      }catch (e){
      ErrorHandler.handleFireStoreError(context, e.toString());
    }

  }
  Future  addDoctor(Doctor doctor,context) async {
    try {
      final response = await users.doc(doctor.id).set(doctor.toJson());
        await _fireStore.collection('doctors').add(doctor.toJson()) ;

      CustomSnackBar.showSuccess(context, 'Doctor added successfully');
      Navigator.pushReplacementNamed(context, AppRoutes.homeScreen,arguments: {
        'id' : doctor.id ,
      });
    } on FirebaseException catch (e) {
      ErrorHandler.handleFireStoreError(context, e.code);
    }catch (e){
      ErrorHandler.handleFireStoreError(context, e.toString());
    }
  }

   Future<Either<UserModel, String>> getUserData (String id )async {
    try {
      final response = await users.doc(id).get() ;
      print('================================================') ;
      print(response.data()) ;

           return Left(UserModel.fromJson(response.data() as Map<String, dynamic> )) ;

    }catch (e){
      print('================================================ eror stert form here ') ;
      return Right(e.toString()) ;
    }

   }
  Future<Either<List<Doctor>, String>> getDoctors() async {
    try {
      final QuerySnapshot snapshot =
      await FirebaseFirestore.instance.collection("doctors").get();

      final doctors = snapshot.docs
          .map((doc) => Doctor.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      return Left(doctors);
    } catch (e) {
      return Right(e.toString());
    }
  }

  Future  uplFiles ({required String id, required String url})async{
    try{
      final data = {
        'id' : id ,
        'url' : url ,
      } ;

      final response =await medicalFiles.add(data) ;

      return 'done' ;
    }catch(e){
      print(']]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]') ;
      print(e) ;
      return 'error:$e' ;
    }
}
Future <Either<List <Hospital_Model>, String>> getHospitals ()async{
  try {
    final QuerySnapshot snapshot =
    await FirebaseFirestore.instance.collection("hospitals").get();

    final hospitals = snapshot.docs
        .map((doc) => Hospital_Model.fromjson(doc.data() as Map<String, dynamic>))
        .toList();

    return Left(hospitals);
  } catch (e) {
    return Right(e.toString());
  }
}
}
