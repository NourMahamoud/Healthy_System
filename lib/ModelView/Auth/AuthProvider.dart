import 'package:doctifityapp/Model/Repository/FireBaseFuncation/AuthFuncation.dart';
import 'package:doctifityapp/View/AuthScreens/Sign_In_Screen.dart';
import 'package:doctifityapp/View/Intro_Screens/OnBoarding_Screens.dart';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/material.dart';

class AuthFunctionProvider extends ChangeNotifier {
   String  role  = '' ;
  void  signUp(String email, String password, String name,context, String role) async{
   final  response = await  AuthFunction().signUp(email, password, name);
   response.fold((user) {
       if (role == 'doctor'){
         print('done') ;
      }else {

       }
   } ,(error){
       ErrorHandler.handleAuthError(context, error);
   }) ;
  }
  void signIn(String email, String password,context) async{
   final  response = await  AuthFunction().signIn(email, password);
    response.fold((user){
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomeScreen()));
    }, (error){
     ErrorHandler.handleAuthError(context, error) ;

    }) ;

  }
  Future resetPassword(String email,context) async{
    final  response = await  AuthFunction().resetPassword(email);
       if(response == 'done'){
         CustomSnackBar.showSuccess(context, 'Password reset email sent successfully');
       }
       else {
         ErrorHandler.handleAuthError(context, response);
       }

  }
  Future signOut(context) async{
    final  response = await  AuthFunction().signOut;
    if (response == 'done'){
     CustomSnackBar.showSuccess(context, 'Signed out successfully');
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> LoginPage()));
    }
    else {
      ErrorHandler.handleAuthError(context, response as String);
    }
  }
  Future sendEmailVer(context) async{
    final  response = await  AuthFunction().sendEmailVerification;
    if (response == 'done'){
      CustomSnackBar.showSuccess(context, 'Email verification sent successfully');
    }
    else {
      ErrorHandler.handleAuthError(context, response as String);
    }


  }

  void  selectRole (String role){
       this.role =  role ;
  }


}