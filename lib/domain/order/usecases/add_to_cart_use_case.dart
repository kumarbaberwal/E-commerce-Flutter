import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/data/order/model/add_to_cart_req.dart';
import 'package:ecommerce/domain/order/repository/order_repository.dart';
import 'package:ecommerce/service_locator.dart';

class AddToCartUseCase implements Usecase<Either, AddToCartReq> {
  @override
  Future<Either> call({AddToCartReq? params}) async {
    return await sl<OrderRepository>().addToCart(params!);
  }
}
