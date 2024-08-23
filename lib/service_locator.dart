import 'package:ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce/domain/auth/usecases/get_ages_use_case.dart';
import 'package:ecommerce/domain/auth/usecases/signup_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // repositories

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // usecases

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
}
