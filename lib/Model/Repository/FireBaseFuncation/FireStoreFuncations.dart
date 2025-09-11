import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/cupertino.dart';

class FireStoreFunction {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future  addUser(User user,  context) async {
    try {
      final response = await users.add(user.toJson());
      CustomSnackBar.showSuccess(context, 'User added successfully');
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseException catch (e) {
      ErrorHandler.handleFireStoreError(context, e.code);
      }catch (e){
      ErrorHandler.handleFireStoreError(context, e.toString());
    }

  }

   Future<Either<User, String>> getUserData (String id )async {
    try {
      final response = await users.where('id' ,isEqualTo: id).get() ;
         if (response.docs.isNotEmpty){
           return Left(User.fromJson(response.docs.cast<Map<String, dynamic>>())) ;
         }
         else {
           return Right('user not found') ;
         }
    }catch (e){
         return Right(e.toString()) ;
    }

   }
}
