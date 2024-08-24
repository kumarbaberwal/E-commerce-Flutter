import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/models/user_creation_request.dart';
import 'package:ecommerce/data/auth/models/user_signin_request.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> getAges();
  Future<Either> getUser();
  Future<bool> isLoggedIn();
  Future<Either> sendPasswordResetEmail(String email);
  Future<Either> signin(UserSigninRequest user);
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
  Future<Either> getUser() async {
    try {
      var currentUser = FirebaseAuth.instance.currentUser;
      var userData = await FirebaseFirestore.instance
          .collection('Users')
          .doc(currentUser?.uid)
          .get().then((value) => value.data(),);
      return Right(userData);
    } catch (e) {
      return const Left('Please Try Again');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return const Right('Passord reset email is sent');
    } catch (e) {
      return const Left('Please Try Again');
    }
  }

  @override
  Future<Either> signin(UserSigninRequest user) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );

      return const Right(
        'Sucessfully Sign in',
      );
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'User not found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong Password provided for that user';
      }
      return Left(message);
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
