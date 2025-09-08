import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SplachScreenController extends ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  final bool _isLoading = true;
  bool get isLoading => _isLoading ;
  void checkUser(context){
    if (FirebaseAuth.instance.currentUser != null){
    users.where('id' ,isEqualTo: FirebaseAuth.instance.currentUser!.uid).get().then((val){
      if (val.docs.first ['role'] == 'doctor'){
        print('doctor') ;
        //Navigator.of(context).pushReplacementNamed('/doctor') ;
      } else if (val.docs.first['role']== 'hospital'){
         print('hospital') ;
      }else{
        print('patient') ;
       // Navigator.of(context).pushReplacementNamed('/patient') ;
      }
  }).catchError((e){
      ErrorHandler.handleAuthError(context, e.toString()) ;
    });
              // Type of user decide here
    }else{
      // 
      Navigator.of(context).pushReplacementNamed('/onboarding') ;
    }
  }
}