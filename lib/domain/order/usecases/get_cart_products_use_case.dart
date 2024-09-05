import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/domain/order/repository/order_repository.dart';
import 'package:ecommerce/service_locator.dart';

class GetCartProductsUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<OrderRepository>().getCartProducts();
  }
}
