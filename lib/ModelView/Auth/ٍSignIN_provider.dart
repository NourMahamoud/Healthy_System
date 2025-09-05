import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController ;
  late final TextEditingController passwordController ;
  bool isObscure = true;
  SignInProvider() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void togglePasswordVisibility()  {
    isObscure = !isObscure;
    notifyListeners();

  }
}