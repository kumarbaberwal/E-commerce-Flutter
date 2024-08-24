import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/models/user_creation_request.dart';
import 'package:ecommerce/data/auth/models/user_model.dart';
import 'package:ecommerce/data/auth/models/user_signin_request.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseService>().getUser();
    return user.fold((error) {
      return Left(error);
    }, (data) {
      return Right(UserModel.fromJson(data).toEntity());
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<Either> signin(UserSigninRequest user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> signup(UserCreationRequest user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }
}
