import 'package:doctifityapp/ModelView/Auth/%D9%8DSignIN_provider.dart';
import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:provider/provider.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/material.dart';
import 'package:doctifityapp/utills/ScreenSize.dart';
import 'package:doctifityapp/ModelView/Auth/AuthProvider.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignInProvider(),
      child:  Login(),
    );
  }
}

class Login extends StatelessWidget {
   Login({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<SignInProvider>(context);
    final auth =Provider.of<AuthFunctionProvider>(context) ;

    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: ScreenSize.height(context)*0.016,
              children: [
                SizedBox(height:  ScreenSize.height(context)*0.048),
                Text(
                  'Welcome back ! ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Login to your existing account ',
                  style: TextStyle(color: Colors.grey),
                ),
                Center(
                  child: Image.asset(
                    ImagePath.logo,
                    height: ScreenSize.height(context)*0.322,
                    width: ScreenSize.width(context)*0.67,
                  ),
                ),
                Text('Email Address'),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(

                        obscureText: false,
                        controller: login.emailController,
                        validator: (val) {
                          if (val!.isEmpty){
                            return 'Please enter your email';

                          } else if (!val.contains('@')){
                            return 'Please enter a valid email';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('Email'),
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
                        controller: login.passwordController,
                        obscureText: login.isObscure ,

                        validator: (val){
                          if (val!.isEmpty){
                            return 'Please enter your password';}
                          else if (val.length < 6){
                            return 'Password must be at least 6 characters';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          label: Text('Password'),
                          suffixIcon:IconButton(onPressed: (){
                                 login.togglePasswordVisibility();
                          }, icon: Icon(login.isObscure ? Icons.visibility :Icons.visibility_off,),) ,

                          hintText: 'Enter your password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [

                    Spacer(),
                     TextButton(
                          onPressed: ()async{
                            await auth.resetPassword(login.emailController.text, context);
                          },
                          child: Text('Forgot password?',style: TextStyle(color: App_Colors.generalColor),),
                        )

                  ],
                ),
                Center(
                  child: Consumer<AuthFunctionProvider>(
                    builder: (context,function , child) {
                      return MaterialButton(
                        onPressed: (){
                          if (_formKey.currentState!.validate()){
                            function.signIn(login.emailController.text, login.passwordController.text, context) ;
                          }
                        },
                        color: App_Colors.generalColor,
                        minWidth: ScreenSize.width(context) * 0.75,
                        child: Text(
                          'Log in',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  ),
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      Consumer(
                        builder: (context,pro,child ) {
                          return TextButton(onPressed: (){
                            Navigator.of(context).pushReplacementNamed('/signup');
                          }, child: Text('Sign up',style: TextStyle(color: App_Colors.generalColor,fontWeight: FontWeight.bold)));
                        }
                      ) ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}



