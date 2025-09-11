import 'package:doctifityapp/Model/Repository/FireBaseFuncation/AuthFuncation.dart';
import 'package:doctifityapp/View/AuthScreens/Sign_In_Screen.dart';
import 'package:doctifityapp/View/CompleteAccount/CompleteAcountPage.dart';
import 'package:doctifityapp/View/Intro_Screens/OnBoarding_Screens.dart';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/material.dart';

class AuthFunctionProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String rule = '';

  void signUp(String email, String password, String name, context) async {
    setLoading(true);
    final response = await AuthFunction().signUp(email, password, name);
    response.fold(
      (user) {
        if (rule != '') {
          setLoading(false);
          CustomSnackBar.showSuccess(context, 'Account created successfully');
          sendEmailVer(context, user);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => CompleteAccountPage(
                  rule: rule,
                  name: user!.displayName!,
                  email: user.email!,
                  id: user.uid,
                ),
              ),
            );

        } else {
          ErrorHandler.handleAuthError(context, 'Pls Select Rule');
        }
      },
      (error) {
        ErrorHandler.handleAuthError(context, error);
      },
    );
  }

  void signIn(String email, String password, context) async {
    final response = await AuthFunction().signIn(email, password);
    response.fold(
      (user) {
        if (user!.emailVerified) {
          Navigator.of(
            context,
          ).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
        } else {
          CustomSnackBar.showError(context, 'Please verify your email');
          sendEmailVer(context, user);
        }
      },
      (error) {
        ErrorHandler.handleAuthError(context, error);
      },
    );
  }

  Future resetPassword(String email, context) async {
    final response = await AuthFunction().resetPassword(email);
    if (response == 'done') {
      CustomSnackBar.showSuccess(
        context,
        'Password reset email sent successfully',
      );
    } else {
      ErrorHandler.handleAuthError(context, response);
    }
  }

  Future signOut(context) async {
    final response = AuthFunction().signOut;
    if (response == 'done') {
      CustomSnackBar.showSuccess(context, 'Signed out successfully');
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => LoginPage()));
    } else {
      ErrorHandler.handleAuthError(context, response as String);
    }
  }

  Future sendEmailVer(context, user) async {
    final response = AuthFunction().sendEmailVerification(user);
    if (response == 'done') {
      CustomSnackBar.showSuccess(
        context,
        'Email verification sent successfully',
      );
    } else {
      ErrorHandler.handleAuthError(context, response as String);
    }
  }

  void selectRole(String rule) {
    this.rule = rule;
    notifyListeners();
  }
}
