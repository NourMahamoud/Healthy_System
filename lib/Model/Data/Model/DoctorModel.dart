import 'package:doctifityapp/Model/Data/Model/UserModel.dart';

class Doctor extends User {
  final String specialization;
  final String clinic_address;
  final String clinic_nunmber;
  Doctor(
    this.specialization,
    this.clinic_address,
    this.clinic_nunmber,
      super.imageUrl ,
  {
    required super.age ,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.nationalId,
    required super.gender,
    required super.healthHistory,
    required super.role,
    required super.id,
    required super.emergencyContact,

  }
  );
  Map<String, dynamic> toJson() {
    return {
      'specialization': specialization,
      'clinic_address': clinic_address,
      'clinic_nunmber': clinic_nunmber,
      'name': super.name,
      'email': super.email,
      'phoneNumber':super. phoneNumber,
      'nationalId': super.nationalId,
      'age': super.age,
      'gender':super. gender,
      'role': super.role,
      'emergencyContact': super.emergencyContact,
      'id': super.id,
      'imageUrl': super.imageUrl,
      'healthHistory': healthHistory.map((h) => h.toJson()).toList(),

     } ;
  }
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      json  ['imageUrl'],
      json['specialization'],
      json['clinic_address'],
      json['clinic_nunmber'],
        age: json['age'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      nationalId: json['nationalId'],
      gender: json['gender'],
      healthHistory: json['healthHistory'],
      role: json['role'],
      id: json['id'],
      emergencyContact: json['emergencyContact'] )
    ;


  }
}
