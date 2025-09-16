import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class AuthFunction {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future <Either<User ?, String>> signUp(String email, String password, String name) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload(); // refresh user info
        return Left(_auth.currentUser); // return updated user
      }
      return Right('Something went wrong');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       return Right('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Right('The account already exists for that email.');
      }
      return Right(e.code);
    } catch (e) {
      return Right(e.toString());
    }

  }
  Future <Either<User ?, String>> signIn(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      User? user = credential.user;
      if (credential.user != null) {

        return Left(user);
      }else {
        return Right('Something went wrong');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Right('No user found for that email.');
      } else if (e.code == 'wrong-password') {
       return Right('Wrong password provided for that user.');
      } else{
        return Right(e.code);
      }
    }
  }
  Future <String> resetPassword(String email) async {
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return 'done' ;
    }catch (e){
      return e.toString() ;
    }


  }
  Future  <String>signOut(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      return 'done' ;

    } catch (e) {
      return e.toString() ;
    }

  }
  Future <String> sendEmailVerification(dynamic user) async {
    try{
      await user?.sendEmailVerification();
      return 'done' ;

    }catch (e){
      return e.toString() ;
    }
}
  Future <String> deleteAccount() async {
    try{
      await FirebaseAuth.instance.currentUser!.delete();

      return 'done' ;
      }catch (e){
      return e.toString() ;
    }
  }


}