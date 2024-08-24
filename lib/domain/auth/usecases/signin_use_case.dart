import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/data/auth/models/user_signin_request.dart';
import 'package:ecommerce/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce/service_locator.dart';

class SigninUseCase implements Usecase<Either, UserSigninRequest> {
  @override
  Future<Either> call({UserSigninRequest? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
