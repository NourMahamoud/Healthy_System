class Hospital_Model {
  final String  name ;
  final String email ;
  final  String  phoneNumber ;
  final String _password ;
  final String address ;
  final String  id ;

  Hospital_Model(this.name, this.email, this.phoneNumber, this._password,
      this.address, this.id);
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": _password,
      "address": address,
      "id": id,
    };
  }
  factory Hospital_Model.fromjson (jeson){
    return Hospital_Model(jeson['name'], jeson['email'], jeson['phoneNumber'], jeson['password'], jeson['address'], jeson['id']);
  }
}
