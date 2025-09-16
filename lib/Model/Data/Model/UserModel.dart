import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart';

class UserModel {
  final String? id;

  final String role;

  final String name;
  final String email;
  final String phoneNumber;
  final String nationalId;
  final int age;
  final String gender;
  final String emergencyContact;
  final List <HealthRecord>healthHistory;
  final String? imageUrl;

  final String smoker;

  final String alcohol;
  final String bloodType;
  final List  ? medecineList ;

  UserModel(
    this.imageUrl, {
  this.medecineList ,
    required this.smoker,
    required this.alcohol,
    required this.bloodType,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.nationalId,
    required this.age,
    required this.gender,
    required this.healthHistory,
    required this.role,
    this.id,
    required this.emergencyContact,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phoneNumber': phoneNumber,
    'nationalId': nationalId,
    'age': age,
    'gender': gender,
    'role': role,
    'emergencyContact': emergencyContact,
    'healthHistory': healthHistory.map((h) => h.toJson()).toList(),
    'id': id,
    'imageUrl': imageUrl,
    'smoker': smoker,
    'alcohol': alcohol,
    'bloodType': bloodType,
    'medecineList': medecineList,
  };

  factory UserModel.fromJson(Map<String, dynamic> json) {

    print(json['medecineList']) ;
    return UserModel(
      medecineList: json['medecineList'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      nationalId: json['nationalId'],
      age: json['age'],
      gender: json['gender'],
      role: json['role'],
      id: json['id'],
      emergencyContact: json['emergencyContact'],
      healthHistory: (json['healthHistory'] as List<dynamic>)
          .map((e) => HealthRecord.fromJson(e as Map<String, dynamic>))
          .toList()
          .cast<HealthRecord>(), // Explicitly cast to List<HealthRecord>
      json['imageUrl'], // Added missing parameter name
      smoker: json['smoker'],
      alcohol: json['alcohol'],
      bloodType: json['bloodType'],
    );
  }

  factory UserModel.empty() {
    return UserModel(
      null,
      name: '',
      email: '',
      phoneNumber: '',
      nationalId: '',
      age: 0,
      gender: '',
      healthHistory: [],
      role: '',
      emergencyContact: '',
      smoker: '',
      alcohol: '',
      bloodType: '',

      medecineList: [],

    );
  }
}
