import 'package:doctifityapp/ModelView/Auth/AuthProvider.dart';
import 'package:doctifityapp/ModelView/Auth/SignUp_Provider.dart';
import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:doctifityapp/utills/ScreenSize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignUpProvider(),
      child:  SignUp(),
    );
  }
}
class SignUp extends StatelessWidget {
  SignUp({super.key});

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthFunctionProvider>(context);
    final uiProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: ScreenSize.height(context)*0.016,
              children: [
                SizedBox(height: ScreenSize.height(context)*0.048),

                Center(
                  child: Image.asset(
                    Image_path().SignUp_image ,
                    height: ScreenSize.height(context)*0.322,
                    width: ScreenSize.width(context)*0.67,
                  ),
                ),

                Form(

                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    spacing: ScreenSize.height(context)*0.016,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name '),
                      TextFormField(
                        obscureText: false,
                        controller: uiProvider.nameController,
                        validator: (val) {
                          if (val!.isEmpty){
                            return 'Please enter your Name';

                          } else {
                            return null ;
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('Name'),
                          hintText: 'username',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      Text('Email Address'),
                      TextFormField(
                        obscureText: false,
                        controller: uiProvider.emailController,
                        validator: (val) {
                          if (val!.isEmpty){
                            return 'Please enter your email';

                          } if (!val.contains('@')){
                            return 'Please enter a valid email';
                          }else {
                            return null ;
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('Email '),
                          hintText: 'e.g name@example.com',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                      Text('Password'),
                      TextFormField(
                        controller: uiProvider.passwordController,
                        obscureText: uiProvider.isObscurePassword,

                        validator: (val){
                          if (val!.isEmpty){
                            return 'Please enter your password';}
                          else if (val.length < 6){
                            return 'Password must be at least 6 characters';
                          }else {
                            return null ;
                          }

                        },
                        decoration: InputDecoration(
                          label: Text('Password'),
                          suffixIcon:IconButton(onPressed: uiProvider.toggleObscurePassword, icon: Icon(uiProvider.isObscureConfirmpassword ? Icons.visibility :Icons.visibility_off,),) ,

                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          // counter: TextButton(onPressed: (){}, child: Text('Forgot password?'))
                        ),
                      ), Text('Confirm Password'),
                      TextFormField(
                        controller: uiProvider.confirmPasswordController,
                        obscureText: uiProvider.isObscureConfirmpassword,

                        validator: (val){
                          if (val! !=  uiProvider.passwordController.text){
                            return 'Confirm password and Password not  matching ';}
                          else {
                            return null ;
                          }

                        },
                        decoration: InputDecoration(
                          label: Text('Confirm password'),
                          suffixIcon:IconButton(onPressed : uiProvider.toggleObscureConfirmpassword, icon: Icon(uiProvider.isObscureConfirmpassword ? Icons.visibility :Icons.visibility_off,),) ,

                          hintText: 'Confirm Password Must be same password ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          // counter: TextButton(onPressed: (){}, child: Text('Forgot password?'))
                        ),
                      ),

                    ],
                  ),
                ),


                Center(
                  child: MaterialButton(
                    onPressed: () async{
                      if (_formKey.currentState!.validate()) {
                        auth.signUp(uiProvider.emailController.text, uiProvider.passwordController.text, uiProvider.nameController.text, context, auth.role);
    }}
                    ,
                    color: App_Colors.generalColor,
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                    minWidth: ScreenSize.width(context) * 0.75,
                  ),
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(onPressed: () {
                        auth.signUp(uiProvider.emailController.text, uiProvider.passwordController.text, uiProvider.nameController.text, context, 'Doctor') ;
                      }, child: Text('Sign in',style: TextStyle(color: App_Colors.generalColor,fontWeight: FontWeight.bold))) ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
