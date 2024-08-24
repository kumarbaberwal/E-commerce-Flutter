import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/models/user_creation_request.dart';
import 'package:ecommerce/data/auth/models/user_signin_request.dart';

abstract class AuthRepository {
  Future<Either> signup(UserCreationRequest user);
  Future<Either> signin(UserSigninRequest user);
  Future<Either> getAges();
  Future<Either> sendPasswordResetEmail(String email);
}
