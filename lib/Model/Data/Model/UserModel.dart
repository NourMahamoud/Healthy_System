
import 'package:doctifityapp/Model/Data/Model/HealthRecorde.dart';

class User {
 final String ? id ;
 final String role ;
 final String name;
 final String email;
 final String phoneNumber;
 final String nationalId;
 final int age;
 final String gender;
 final String emergencyContact;
 final List<HealthRecord> healthHistory;

 User( {
  required this.name,
  required this.email,
  required this.phoneNumber,
  required this.nationalId,
  required this.age,
  required this.gender,
  required this.healthHistory,
  required this.role  ,
  this.id ,
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
 };

 factory User.fromJson(List <Map<String, dynamic>> json) => User(
  name: json.first['name'],
  email: json.first['email'],
  phoneNumber: json.first['phoneNumber'],
  nationalId: json.first['nationalId'],
  age: json.first['age'],
  gender: json.first['gender'],
  role: json.first['role'],
  id: json.first['id'],
  emergencyContact: json.first['emergencyContact'],
  healthHistory: (json.first['healthHistory'] )
      .map((e) => HealthRecord.fromJson(e))
      .toList(),
 );
}
