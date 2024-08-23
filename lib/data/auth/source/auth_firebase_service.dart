import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/models/user_creation_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> getAges();
  Future<Either> signup(UserCreationRequest user);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> getAges() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Ages').get();
      return Right(returnedData.docs);
    } catch (e) {
      return const Left('Please Try Again!');
    }
  }

  @override
  Future<Either> signup(UserCreationRequest user) async {
    try {
      var returnedData =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(returnedData.user!.uid)
          .set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'password': user.password,
        'gender': user.gender,
        'age': user.age,
      });

      return const Right(
        'Sucessfully Sign up',
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'This password provided is to weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with this email';
      }
      return Left(message);
    }
  }
}
