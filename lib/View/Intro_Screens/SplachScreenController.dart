import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SplachScreenController extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading ;
  void checkUser(context){
    if (FirebaseAuth.instance.currentUser != null){
      print('Nour') ;
              // Type of user decide here
    }else{
      // 
      Navigator.of(context).pushReplacementNamed('/onboarding') ;
    }
  }
}