import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctifityapp/utills/AppRoutes.dart';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SplachScreenController extends ChangeNotifier {
     final FirebaseAuth _auth = FirebaseAuth.instance;
  final bool _isLoading = true;
  bool get isLoading => _isLoading ;
  void checkUser(context){
   if (_auth.currentUser != null) {
     Navigator.pushReplacementNamed(context,AppRoutes.homeScreen, arguments: {
       'id': _auth.currentUser!.uid,
     }) ;
   } else {
     Navigator.pushReplacementNamed(context,AppRoutes.onBoardingScreen) ;
   }

  }
}