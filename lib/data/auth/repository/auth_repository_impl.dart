import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/auth/models/user_creation_request.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> signup(UserCreationRequest user) async {
    return await sl<AuthFirebaseService>().signup(user);
  }
}
