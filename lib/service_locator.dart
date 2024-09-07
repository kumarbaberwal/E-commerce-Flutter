import 'package:ecommerce/data/auth/repository/auth_repository_impl.dart';
import 'package:ecommerce/data/auth/source/auth_firebase_service.dart';
import 'package:ecommerce/data/category/repository/category_repository_impl.dart';
import 'package:ecommerce/data/category/source/category_firebase_service.dart';
import 'package:ecommerce/data/order/repository/order_repository_impl.dart';
import 'package:ecommerce/data/order/source/order_firebase_service.dart';
import 'package:ecommerce/data/product/repository/product_repository_impl.dart';
import 'package:ecommerce/data/product/source/product_firebase_service.dart';
import 'package:ecommerce/domain/auth/repository/auth_repository.dart';
import 'package:ecommerce/domain/auth/usecases/get_ages_use_case.dart';
import 'package:ecommerce/domain/auth/usecases/get_user_use_case.dart';
import 'package:ecommerce/domain/auth/usecases/is_logged_in_use_case.dart';
import 'package:ecommerce/domain/auth/usecases/send_password_reset_email_use_case.dart';
import 'package:ecommerce/domain/auth/usecases/signin_use_case.dart';
import 'package:ecommerce/domain/auth/usecases/signup_use_case.dart';
import 'package:ecommerce/domain/category/repository/category_repository.dart';
import 'package:ecommerce/domain/category/usecases/get_category_use_case.dart';
import 'package:ecommerce/domain/order/repository/order_repository.dart';
import 'package:ecommerce/domain/order/usecases/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/order/usecases/get_cart_products_use_case.dart';
import 'package:ecommerce/domain/order/usecases/remove_cart_product_use_case.dart';
import 'package:ecommerce/domain/product/repository/product_repository.dart';
import 'package:ecommerce/domain/product/usecases/get_new_in_use_case.dart';
import 'package:ecommerce/domain/product/usecases/get_products_by_category_id_use_case.dart';
import 'package:ecommerce/domain/product/usecases/get_products_by_title_use_case.dart';
import 'package:ecommerce/domain/product/usecases/get_top_selling_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());
  sl.registerSingleton<OrderFirebaseService>(OrderFirebaseServiceImpl());

  // repositories

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl());

  // usecases

  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<SendPasswordResetEmailUseCase>(
      SendPasswordResetEmailUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetCategoryUseCase>(GetCategoryUseCase());
  sl.registerSingleton<GetTopSellingUseCase>(GetTopSellingUseCase());
  sl.registerSingleton<GetNewInUseCase>(GetNewInUseCase());
  sl.registerSingleton<GetProductsByCategoryIdUseCase>(
      GetProductsByCategoryIdUseCase());
  sl.registerSingleton<GetProductsByTitleUseCase>(GetProductsByTitleUseCase());
  sl.registerSingleton<AddToCartUseCase>(AddToCartUseCase());
  sl.registerSingleton<GetCartProductsUseCase>(GetCartProductsUseCase());
  sl.registerSingleton<RemoveCartProductUseCase>(RemoveCartProductUseCase());
}
