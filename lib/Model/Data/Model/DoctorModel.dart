import 'package:doctifityapp/Model/Data/Model/UserModel.dart';
import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart';

class Doctor extends User {
  final String specialization;
  final String clinicAddress;
  final String clinicNumber;
  final String? availabilityStartTime;
  final String? availabilityEndTime;

  Doctor({
    required this.specialization,
    required this.clinicAddress,
    required this.clinicNumber,
    required super.age,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.nationalIdUrl,
    required super.gender,
    required super.healthHistory,
    required super.role,
    required super.id,
    required super.emergencyContact,
    this.availabilityStartTime,
    this.availabilityEndTime,
  }) : super(medicalFiles: const []);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'nationalId': nationalIdUrl,
      'age': age,
      'gender': gender,
      'role': role,
      'emergencyContact': emergencyContact,
      'specialization': specialization,
      'clinicAddress': clinicAddress,
      'clinicNumber': clinicNumber,
      'availabilityStartTime': availabilityStartTime,
      'availabilityEndTime': availabilityEndTime,
      'healthHistory': healthHistory.map((h) => h.toJson()).toList(),
    };
  }

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      specialization: json['specialization'],
      clinicAddress: json['clinicAddress'],
      clinicNumber: json['clinicNumber'],
      availabilityStartTime: json['availabilityStartTime'],
      availabilityEndTime: json['availabilityEndTime'],
      age: json['age'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      healthHistory: (json['healthHistory'] as List<dynamic>)
          .map((e) => HealthRecord.fromJson(e))
          .toList(),
      role: json['role'],
      id: json['id'],
      emergencyContact: json['emergencyContact'],
      nationalIdUrl: json['nationalId'],
    );
  }
}
