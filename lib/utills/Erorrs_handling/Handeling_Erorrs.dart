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

  static void handleFireStoreError(BuildContext context, String errorCode) {
    final message = _getFireStoreErrorMessage(errorCode);
    _logger.e('FireStore Error: $errorCode - $message') ;
    CustomSnackBar.showError(context, _getFireStoreErrorMessage(errorCode));

  }
  static String _getFireStoreErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'permission-denied':
      return  'You don’t have permission to add data.';
      case 'unavailable':
         return 'Firestore service is currently unavailable. Try again later.';
        ;
      case 'invalid-argument':
         return  'Invalid data format.';
        ;
      default:
        return 'An unexpected Firestore error occurred: ${errorCode}';
    }

  }
  static void handleSupabaseStorageError(BuildContext context, String errorCode) {
    final message = _getSupabaseStorageErrorMessage(errorCode);
    _logger.e('Supabase Storage Error: $errorCode - $message');
    CustomSnackBar.showError(context, message);
  }

  static String _getSupabaseStorageErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'storage/object-not-found':
        return 'The requested file does not exist.';
      case 'storage/unauthorized':
        return 'You don\'t have permission to access this file.';
      case 'storage/forbidden':
        return 'Access to this file is forbidden.';
      case 'storage/too-large':
        return 'The file is too large to upload.';
      case 'storage/invalid-format':
        return 'The file format is not supported.';
      case 'storage/bucket-not-found':
        return 'The storage bucket was not found.';
      case 'storage/network-error':
        return 'A network error occurred while accessing storage.';
      case 'storage/retry-limit-exceeded':
        return 'The operation failed after multiple attempts. Please try again.';
      case 'storage/invalid-credentials':
        return 'Invalid storage credentials. Please contact support.';
      case 'storage/operation-aborted':
        return 'The storage operation was cancelled.';
      case 'storage/quota-exceeded':
        return 'Storage quota has been exceeded. Please free up space.';
      default:
        return 'An unexpected storage error occurred: $errorCode';
    }
  }


}