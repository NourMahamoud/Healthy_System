import 'package:doctifityapp/model/model_doctor.dart';
import 'package:doctifityapp/model/model_hospital.dart';
import 'package:doctifityapp/model/model_user.dart';
import 'package:doctifityapp/utills/ImagePath.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  List<Doctor> _doctors = [];
  List<Hospital> _hospitals = [];
  List<User> _users = [];
  List<Doctor> get doctors => _doctors;
  List<Hospital> get hospitals => _hospitals;
  List<User> get users => _users;
  User? get currentUser => _users.isNotEmpty ? _users.first : null;

  HomeViewModel() {
    _loadData();
  }

  get user => null;

  void _loadData() {
    _users = [
      User(
        name: 'Yossif',
        age: '20',
        email: 'yossif@example',
        imageUrl: Image_path().doctor_headphone,
        address: '11 Al Laithi ST El Sharabia',
      ),
      User(
        name: 'Ahmed',
        age: '20',
        email: 'ahmed@example',
        imageUrl: Image_path().doctor_headphone,
        address: '515 Al Waleed Bin Talal Street, Maadi',
      ),
      User(
        name: 'Yossif',
        age: '20',
        email: 'yossif@example',
        imageUrl: Image_path().doctor_headphone,
        address: '515 Al Waleed Bin Talal Street, Maadi',
      ),
    ];
    _doctors = [
      Doctor(
        name: "Yossif",
        specialty: "Psychologist",
        imageUrl: Image_path().doctor_headphone,
        email: 'yossif@example',
        age: '20',
        phone: '01221966567',
        address: '515 Al Waleed Bin Talal Street, Maadi',
      ),
      Doctor(
        name: "Nour",
        specialty: "Cardiologist",
        imageUrl: Image_path().doctor_headphone,
        email: 'nour@example',
        age: '21',
        phone: '01221966567',
        address: '515 Al Waleed Bin Talal Street, Maadi',
      ),
      Doctor(
        name: "Ibrahim",
        specialty: "Oral Surgeon",
        imageUrl: Image_path().doctor_headphone,
        email: 'Ibrahim@example',
        age: '30',
        phone: '01221966567',
        address: '515 Al Waleed Bin Talal Street, Maadi',
      ),
      Doctor(
        name: "Mouhammed",
        specialty: "Psychologist ",
        imageUrl: Image_path().doctor_headphone,
        email: 'mouhammed@example',
        age: '40',phone: '01221966567',
        address: '515 Al Waleed Bin Talal Street, Maadi',
      ),
      Doctor(
        name: "Nour",
        specialty: "Cardiologist",
        imageUrl: Image_path().doctor_headphone,
        email: 'nour@example',
        age: '21',
        phone: '01221966567',
        address: '515 Al Waleed Bin Talal Street, Maadi',
      ),
    ];

    _hospitals = [
      Hospital(
        name: "El Maadi Hospital",
        rating: 4.2,
        reviews: 250,
        location: "Maadi",
        imageUrl: Image_path().selection,
        email: 'ElMaadi@example',
        phone: "01121966567"
      ),
      Hospital(
        name: "El Nada Maternity Hospital",
        rating: 4.6,
        reviews: 180,
        location: "515 Al Waleed Bin Talal Street, Maadi",
        imageUrl: Image_path().selection,
        email: 'Elnada@example',
        phone: "01121966567"
      ),
    ];

    notifyListeners();
  }
}
