import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpProvider extends  ChangeNotifier {
  late final TextEditingController emailController ;
  late final TextEditingController nameController ;
  late final TextEditingController passwordController ;
  late final TextEditingController confirmPasswordController ;
  bool isObscurePassword= true;
  bool isObscureConfirmpassword= true;
  bool val = false ;
  List <String> roles = ['Doctor' , 'Hospital' , 'Patient'] ;


  SignUpProvider(){
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController =  TextEditingController() ;
    confirmPasswordController = TextEditingController() ;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose() ;
    confirmPasswordController.dispose() ;
  }

void  toggleObscurePassword(){
    isObscurePassword = !isObscurePassword ;
    notifyListeners();
}
void  toggleObscureConfirmpassword(){
    isObscureConfirmpassword = !isObscureConfirmpassword ;
    notifyListeners();
}
void  toggleVal(){
    val = !val ;
}



}