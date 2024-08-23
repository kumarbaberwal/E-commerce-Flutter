import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/data/auth/models/user_creation_request.dart';
import 'package:ecommerce/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce/service_locator.dart';

class SignupUseCase implements Usecase<Either, UserCreationRequest> {
  @override
  Future<Either> call({UserCreationRequest? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
