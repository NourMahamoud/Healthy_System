import 'package:doctifityapp/utills/ColorCodes.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController ;
  late final TextEditingController nameController ;
  late final TextEditingController passwordController ;
  late final TextEditingController confirmPasswordController ;
  bool _isObscurePassword= true;
  bool _isObscureConfirmpassword= true;
  bool val = false ;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController =  TextEditingController() ;
    confirmPasswordController = TextEditingController() ;
    super.initState();
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
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: height*0.016,
              children: [
                SizedBox(height: height*0.048),

                Center(
                  child: Image.asset(
                    Image_path().SignUp_image ,
                    height: height*0.322,
                    width: width*0.67,
                  ),
                ),

                Form(

                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    spacing: height*0.016,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name '),
                      TextFormField(
                        obscureText: false,
                        controller: nameController,
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
                        controller: emailController,
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
                        controller: passwordController,
                        obscureText: _isObscurePassword,

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
                          suffixIcon:IconButton(onPressed: (){
                            setState(() {
                              _isObscurePassword= !_isObscurePassword ;
                            });
                          }, icon: Icon(_isObscurePassword ? Icons.visibility :Icons.visibility_off,),) ,

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
                        controller: confirmPasswordController,
                        obscureText: _isObscureConfirmpassword,

                        validator: (val){
                          if (val! !=  passwordController.text){
                            return 'Confirm password and Password not  matching ';}
                          else {
                            return null ;
                          }

                        },
                        decoration: InputDecoration(
                          label: Text('Confirm password'),
                          suffixIcon:IconButton(onPressed: (){
                            setState(() {
                              _isObscureConfirmpassword= !_isObscureConfirmpassword ;
                            });
                          }, icon: Icon(_isObscureConfirmpassword ? Icons.visibility :Icons.visibility_off,),) ,

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
                     //   await  Auth_Funcation().Sign_up(emailController.text, passwordController.text,nameController.text);
                      }
                     // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomePage()));
                    }
                    ,
                    color: App_Colors.generalColor,
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: Colors.white),
                    ),
                    minWidth: width * 0.75,
                  ),
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(onPressed: () {
                       // Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Login()));
                      }, child: Text('Sign in',style: TextStyle(color: App_Colors.generalColor,fontWeight: FontWeight.bold))) ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
