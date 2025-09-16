
import 'package:doctifityapp/Model/Data/Model/DoctorModel.dart';
import 'package:doctifityapp/Model/Data/Model/Hospital_Model.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';
import 'package:doctifityapp/Model/Repository/FireBaseFuncation/FireStoreFuncations.dart';
import 'package:doctifityapp/ModelView/HomePageProvider/UiProviderHomeScreen.dart';
import 'package:doctifityapp/View/HomePageScreens/Appointments_screen.dart';
import 'package:doctifityapp/View/HomePageScreens/MyAccount_screen.dart';
import 'package:doctifityapp/View/HomePageScreens/doctors_screen.dart';
import 'package:doctifityapp/View/HomePageScreens/home_screen.dart';
import 'package:doctifityapp/View/HomePageScreens/hosoitals_screen.dart';
import 'package:doctifityapp/View/HomePageScreens/notification_screen.dart';
import 'package:doctifityapp/utills/Erorrs_handling/Handeling_Erorrs.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';

class LogicProviderHomeScreen extends ChangeNotifier {
  final FireStoreFunction _fireStoreFunction = FireStoreFunction() ;
  late final List<Doctor> doctors ;
  late final List<Hospital_Model> hospitals ;

  late UserModel user  ;
   final String id ;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  LogicProviderHomeScreen({ required this.id,context}){
  getUserModel(context) ;
  getDoctors(context) ;
  getHospitals(context) ;
  }
  void getUserModel (BuildContext context)async{
    final response  =  await  _fireStoreFunction.getUserData(id) ;
    response.fold((userModel) async {
      print(userModel.medecineList);

      this.user = await UserModel(id: userModel.id,userModel.imageUrl, name: userModel.name, email: userModel.email, phoneNumber: userModel.phoneNumber, nationalId: userModel.nationalId, age: userModel.age, gender: userModel.gender, healthHistory: userModel.healthHistory, role: userModel.role, emergencyContact: userModel.emergencyContact, smoker: userModel.smoker, alcohol: userModel.alcohol, bloodType: userModel.bloodType,medecineList: userModel.medecineList) ;

      notifyListeners();
      Provider.of<UiHomePageProvider>(context, listen: false).getUser(this.user);
      notifyListeners() ;
    }, (error) {
      print(error) ;
    } ) ;
  }
  void  getDoctors (context)async{
    try {
      final response = await _fireStoreFunction.getDoctors() ;
      response.fold((doctors) {
        this.doctors = doctors ;
        Provider.of<UiHomePageProvider>(context, listen: false).getDoctors(doctors) ;

        notifyListeners() ;
      }, (error) {
        print(error) ;
      } );
    } on Exception catch (e) {
      ErrorHandler.handleFireStoreError(context, e.toString());
    }
  }
  void  getHospitals (context)async{
    try {
      final response = await _fireStoreFunction.getHospitals() ;
      response.fold((hos) {
        this.hospitals = hos ;
        Provider.of<UiHomePageProvider>(context, listen: false).getHospitals(hospitals);

        notifyListeners() ;
      }, (error) {
        print(error) ;
      } );
    } on Exception catch (e) {
      ErrorHandler.handleFireStoreError(context, e.toString());
    }
  }



  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget getChangeScreens (){
       switch (_currentIndex) {
         case 1 :
           return DoctorsScreen();
            case 2:
              return HospitalsScreen();
            case 3:
              return ProfileScreen();
              default:
            return HomeScreen();
       }

  }




}