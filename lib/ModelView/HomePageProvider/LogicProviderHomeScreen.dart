import 'package:doctifityapp/Model/Data/Model/DoctorModel.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';
import 'package:doctifityapp/Model/Repository/FireBaseFuncation/FireStoreFuncations.dart';
import 'package:doctifityapp/Model/model_hospital.dart';
import 'package:doctifityapp/View/HomePageScreens/Appointments_screen.dart';
import 'package:doctifityapp/View/HomePageScreens/home_screen.dart';
import 'package:doctifityapp/View/HomePageScreens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  final FireStoreFunction _fireStoreFunction = FireStoreFunction() ;
  late final List<Doctor> doctors ;
  late final List<Hospital> hospitals ;

  late User user  = User('', id: '',name: '', email: '', phoneNumber: '', nationalId: '', age: 9, gender: '', healthHistory: [], role: '', emergencyContact: '') ;
   final String id ;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  HomePageProvider( this.id){
   getUser() ;

  }
  void getUser ()async{
    final response  =  await  _fireStoreFunction.getUserData(id) ;
    response.fold((user) {
      this.user = user ;
      print('==========================================');
      print(user.email) ;
      print(user.id) ;
      print(user.name) ;

      print('==========================================');

      notifyListeners() ;
    }, (error) {

      print(error) ;

    } ) ;
  }
  void  getDoctors ()async{
    //final response =  await
  }
  void getHospitals (){

  }

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget getChangeScreens (int index){
       switch (index) {
         case 0 :
           return HomeScreen();
            case 1 :
              return Appointments();
            case 2 :
              return NotificationScreen();
            case 3 :
              return HomeScreen();
       }
  }

}