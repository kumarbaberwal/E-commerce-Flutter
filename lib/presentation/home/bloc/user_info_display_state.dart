import 'package:ecommerce/domain/auth/entity/user_entity.dart';

abstract class UserInfoDisplayState {}

class UserInfoLoading extends UserInfoDisplayState {}

class UserInfoLoaded extends UserInfoDisplayState {
  final UserEntity user;

  UserInfoLoaded({required this.user});
}

class UserInfoFailure extends UserInfoDisplayState {
  final String message;

  UserInfoFailure({required this.message});
}
