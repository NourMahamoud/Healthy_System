import 'package:doctifityapp/View/CompleteAccount/CompleteAcountPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:doctifityapp/utills/SnackBar.dart';

class VerifyEmailPage extends StatefulWidget {
  final User user;
  final String rule;

  const VerifyEmailPage({super.key, required this.user, required this.rule});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    checkVerification();
  }

  Future<void> checkVerification() async {
    // Loop until user verifies email
    while (!isVerified) {
      await widget.user.reload();
      setState(() {
        isVerified = widget.user.emailVerified;
      });

      if (!isVerified) {
        await Future.delayed(const Duration(seconds: 3));
      }
    }

    if (mounted) {
      // Navigate once verified
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => CompleteAccountPage(
            rule: widget.rule,
            name: widget.user.displayName!,
            email: widget.user.email!,
            id: widget.user.uid,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isVerified
            ? const Text('Email Verified! Redirecting...')
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Waiting verification your email...'),
          ],
        ),
      ),
    );
  }
}
