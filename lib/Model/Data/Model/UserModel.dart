import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart';

class User {
 final String? id;
 final String role;
 final String name;
 final String email;
 final String phoneNumber;
 final String nationalIdUrl;
 final int age;
 final String gender;
 final String emergencyContact;
 final List<HealthRecord> healthHistory;
 final List<String> medicalFiles;

 User({
  required this.name,
  required this.email,
  required this.phoneNumber,
  required this.nationalIdUrl,
  required this.age,
  required this.gender,
  required this.healthHistory,
  required this.role,
  this.id,
  required this.emergencyContact,
  required this.medicalFiles,
 });

 Map<String, dynamic> toJson() => {
  'id': id,
  'name': name,
  'email': email,
  'phoneNumber': phoneNumber,
  'nationalId': nationalIdUrl,
  'age': age,
  'gender': gender,
  'role': role,
  'emergencyContact': emergencyContact,
  'healthHistory': healthHistory.map((h) => h.toJson()).toList(),
  'medicalFiles': medicalFiles,
 };

 factory User.fromJson(Map<String, dynamic> json) => User(
  id: json['id'],
  name: json['name'],
  email: json['email'],
  phoneNumber: json['phoneNumber'],
  nationalIdUrl: json['nationalId'],
  age: json['age'],
  gender: json['gender'],
  role: json['role'],
  emergencyContact: json['emergencyContact'],
  healthHistory: (json['healthHistory'] as List<dynamic>)
      .map((e) => HealthRecord.fromJson(e))
      .toList(),
  medicalFiles: (json['medicalFiles'] as List<dynamic>)
      .map((e) => e.toString())
      .toList(),
 );
}
