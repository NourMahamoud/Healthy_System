import 'dart:io';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:doctifityapp/utills/SnackBar.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunctions {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<String> uploadFile({
    required File file,
    required BuildContext context,
    String bucketName = 'medical_files'
  }) async {
    try {
      // Validate file
      if (!await file.exists()) {
        throw Exception('File does not exist');
      }

      // Get file details
      final fileExtension = path.extension(file.path);
      final fileName = '${DateTime.now().millisecondsSinceEpoch}$fileExtension';

      // Read file as bytes
      final fileBytes = await file.readAsBytes();

      // Upload file to Supabase storage
      await _supabaseClient.storage
          .from(bucketName)
          .uploadBinary(fileName, fileBytes);

      // Get public URL (assuming bucket is public)
      final publicUrl = _supabaseClient.storage
          .from(bucketName)
          .getPublicUrl(fileName);

      // Show success message
      CustomSnackBar.showSuccess(context, 'File uploaded successfully!');

      return publicUrl;
    } catch (e) {
      // Handle specific Supabase storage errors

        ErrorHandler.handleSupabaseStorageError(context, e.toString());

      // Re-throw the error for the caller to handle if needed
      rethrow;
    }
  }

  // Additional method to create signed URL if needed
  Future<String> getSignedUrl(String fileName, {String bucketName = 'medical_files'}) async {
    try {
      // Create a signed URL that expires in 10 years
      final signedUrl = await _supabaseClient.storage
          .from(bucketName)
          .createSignedUrl(fileName, 60 * 60 * 24 * 365 * 10);

      return signedUrl;
    } catch (e) {
      rethrow;
    }
  }

  // Method to download a file
  Future<File> downloadFile(String fileName, String savePath, {
    String bucketName = 'medical_files',
    BuildContext? context
  }) async {
    try {
      final response = await _supabaseClient.storage
          .from(bucketName)
          .download(fileName);

      // Save file to local path
      final file = File(savePath);
      await file.writeAsBytes(response);

      if (context != null) {
        CustomSnackBar.showSuccess(context, 'File downloaded successfully!');
      }

      return file;
    } catch (e) {
      if (context != null) {

                  ErrorHandler.handleSupabaseStorageError(context, e.toString());
      }
      rethrow;
    }
  }

  // Method to list files in a bucket
  Future<List<FileObject>> listFiles({
    String bucketName = 'medical_files',
    String? folderPath,
    BuildContext? context
  }) async {
    try {
      final response = await _supabaseClient.storage
          .from(bucketName)
          .list(path: folderPath);

      return response;
    } catch (e) {
      if (context != null) {

          ErrorHandler.handleSupabaseStorageError(context, e.toString());

      }
      rethrow;
    }
  }

  // Method to delete a file
  Future<void> deleteFile(String fileName, {
    String bucketName = 'medical_files',
    BuildContext? context
  }) async {
    try {
      await _supabaseClient.storage
          .from(bucketName)
          .remove([fileName]);

      if (context != null) {
        CustomSnackBar.showSuccess(context, 'File deleted successfully!');
      }
    } catch (e) {
      if (context != null) {

          ErrorHandler.handleSupabaseStorageError(context, e.toString());

      }
      rethrow;
    }
  }
}