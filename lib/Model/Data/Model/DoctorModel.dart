import 'package:doctifityapp/Model/Data/Model/UserModel.dart';

class Doctor extends User {
  final String specialization;
  final String clinic_address;
  final String clinic_nunmber;
  Doctor(
    this.specialization,
    this.clinic_address,
    this.clinic_nunmber,
  {
    required super.age ,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.nationalId,
    required super.gender,
    required super.healthHistory,

  }
  );
}
