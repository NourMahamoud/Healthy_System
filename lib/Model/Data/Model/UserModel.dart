
import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart';

class User {
 final String name;
 final String email;
 final String phoneNumber;
 final String nationalId;
 final int age;
 final String gender;
 final List<HealthRecord> healthHistory;

 User({
  required this.name,
  required this.email,
  required this.phoneNumber,
  required this.nationalId,
  required this.age,
  required this.gender,
  required this.healthHistory,
 });

 Map<String, dynamic> toJson() => {
  'name': name,
  'email': email,
  'phoneNumber': phoneNumber,
  'nationalId': nationalId,
  'age': age,
  'gender': gender,
  'healthHistory': healthHistory.map((h) => h.toJson()).toList(),
 };

 factory User.fromJson(Map<String, dynamic> json) => User(
  name: json['name'],
  email: json['email'],
  phoneNumber: json['phoneNumber'],
  nationalId: json['nationalId'],
  age: json['age'],
  gender: json['gender'],
  healthHistory: (json['healthHistory'] as List)
      .map((e) => HealthRecord.fromJson(e))
      .toList(),
 );
}
