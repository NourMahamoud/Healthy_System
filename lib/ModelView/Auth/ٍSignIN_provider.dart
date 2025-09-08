import 'package:flutter/cupertino.dart';

class SignInProvider extends ChangeNotifier {
  late final TextEditingController emailController ;
  late final TextEditingController passwordController ;
  bool isObscure = true;
  SignInProvider() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @override
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