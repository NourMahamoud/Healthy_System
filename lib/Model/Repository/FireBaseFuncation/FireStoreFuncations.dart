import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:doctifityapp/Model/Data/Model/UserModel.dart';

class FireStoreFunction {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> addUser(User user) async {
    return await users
        .add(user.toJson())
        .then((value) {
          return 'done'  ;
    })
        .catchError((error) {
          return error.toString();
    });

  }

   Future<Either<User, String>> getUserData (String id )async {
    try {
      final response = await users.where('id' ,isEqualTo: id).get() ;

         if (response.docs.isNotEmpty){
           return Left(User.fromJson(response.docs.cast<Map<String, dynamic>>())) ;
         }
         else {
           return Right('user not found') ;
         }
    }catch (e){
         return Right(e.toString()) ;
    }

   }
}
