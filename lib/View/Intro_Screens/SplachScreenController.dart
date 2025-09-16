import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctifityapp/Model/Data/Model/Hospital_Model.dart';
import 'package:doctifityapp/ModelView/HomePageProvider/LogicProviderHomeScreen.dart';
import 'package:doctifityapp/utills/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SplachScreenController extends ChangeNotifier {
     final FirebaseAuth _auth = FirebaseAuth.instance;
  final bool _isLoading = true;
  bool get isLoading => _isLoading ;

     void checkUser(context)async{

   if (_auth.currentUser != null) {
     Navigator.pushReplacementNamed(context,AppRoutes.homeScreen, arguments: {
       'id': _auth.currentUser!.uid,
     }) ;
   } else {
     Navigator.pushReplacementNamed(context,AppRoutes.onBoardingScreen) ;
   }

  }
}