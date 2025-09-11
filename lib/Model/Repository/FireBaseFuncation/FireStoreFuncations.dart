import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/cupertino.dart';

class FireStoreFunction {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> addUser(User user, BuildContext context) async {
    try {
      // Use .doc(user.id) instead of .add() so we keep consistent IDs
      await users.doc(user.id).set(user.toJson(), SetOptions(merge: true));

      CustomSnackBar.showSuccess(context, 'User added successfully');
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseException catch (e) {
      ErrorHandler.handleFireStoreError(context, e.code);
    } catch (e) {
      ErrorHandler.handleFireStoreError(context, e.toString());
    }
  }

  Future<Either<User, String>> getUserData(String id) async {
    try {
      final doc = await users.doc(id).get();
      if (doc.exists && doc.data() != null) {
        return Left(User.fromJson(doc.data() as Map<String, dynamic>));
      } else {
        return Right('User not found');
      }
    } catch (e) {
      return Right(e.toString());
    }
  }
}
