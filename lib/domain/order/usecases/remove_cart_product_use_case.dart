import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/domain/order/repository/order_repository.dart';
import 'package:ecommerce/service_locator.dart';

class RemoveCartProductUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<OrderRepository>().removeCartProduct(params!);
  }
}
