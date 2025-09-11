class HospitalModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String _password; // Password is should be Private
  final String address;
  final String id;

  HospitalModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required String password,
    required this.address,
    required this.id,
  }) : _password = password; // Save the password

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'id': id,
    };
  }

  factory HospitalModel.fromMap(Map<String, dynamic> map) {
    return HospitalModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      password: '',
      address: map['address'] ?? '',
      id: map['id'] ?? '',
    );
  }
}
