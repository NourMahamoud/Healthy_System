
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
 final  String ?  imageUrl ;

 User(this.imageUrl,  {
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
  'id': id,
  'imageUrl': imageUrl,
 };

 factory User.fromJson( Map<String, dynamic> json) => User(
  name: json['name'],
  email: json['email'],
  phoneNumber: json['phoneNumber'],
  nationalId: json['nationalId'],
  age: json['age'],
  gender: json['gender'],
  role: json['role'],
  id: json['id'],
  emergencyContact: json['emergencyContact'],
  healthHistory: (json['healthHistory'] )
      .map((e) => HealthRecord.fromJson(e))
      .toList(),
json['imageUrl'],
 );
}
