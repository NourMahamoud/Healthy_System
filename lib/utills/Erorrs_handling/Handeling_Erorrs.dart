import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class ErrorHandler {
  static final Logger _logger = Logger();

  static void handleAuthError(BuildContext context, String errorCode) {
    final message = _getAuthErrorMessage(errorCode);

    _logger.e('Auth Error: $errorCode - $message');
    CustomSnackBar.showError(context, message);

  }
  static String _getAuthErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'The account already exists for that email.';
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'invalid-email':
        return 'Email address is invalid.';
      default:
        return 'An unexpected error occurred: $errorCode';
    }
  }

}