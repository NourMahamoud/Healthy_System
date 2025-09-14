import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctifityapp/Model/Data/Model/DoctorModel.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';
import 'package:doctifityapp/utills/AppRoutes.dart';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/cupertino.dart';

class FireStoreFunction {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future  addUser(User user,  context) async {
    try {
      final response = await users.doc(user.id).set(user.toJson());
      CustomSnackBar.showSuccess(context, 'User added successfully');
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseException catch (e) {
      ErrorHandler.handleFireStoreError(context, e.code);
      }catch (e){
      ErrorHandler.handleFireStoreError(context, e.toString());
    }

  }
  Future  addDoctor(Doctor doctor,  context) async {
    try {
      final response = await users.doc(doctor.id).set(doctor.toJson());

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

   Future<Either<User, String>> getUserData (String id )async {
    try {
      final response = await users.doc(id).get() ;
         if (response.data()!=null){
           return Left(User.fromJson(response.data() as Map<String, dynamic> )) ;
         }
         else {
           print(response.id) ;
           return Right('user not found') ;
         }
    }catch (e){
         return Right(e.toString()) ;
    }

   }
   Future <Either<List <Doctor> , String>> getDoctors() async {
    try {
      final response = await _fireStore.collection('doctors').get() ;
      final doctors = response.docs.map((e) => Doctor.fromJson(e.data())).toList() ;
      return Left(doctors) ;
    }catch(e){
      return Right(e.toString()) ;
    }
   }
}
