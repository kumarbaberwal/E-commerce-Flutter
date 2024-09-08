import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/order/model/add_to_cart_req.dart';
import 'package:ecommerce/data/order/model/order_model.dart';
import 'package:ecommerce/data/order/model/order_registration_req.dart';
import 'package:ecommerce/data/order/model/product_ordered_model.dart';
import 'package:ecommerce/data/order/source/order_firebase_service.dart';
import 'package:ecommerce/domain/order/repository/order_repository.dart';
import 'package:ecommerce/service_locator.dart';

class OrderRepositoryImpl extends OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReq addToCartReq) async {
    return await sl<OrderFirebaseService>().addToCart(addToCartReq);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<OrderFirebaseService>().getCartProducts();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductOrderedModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getOrders() async {
    var returnedData = await sl<OrderFirebaseService>().getOrders();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(
        List.from(data).map((e) => OrderModel.fromMap(e).toEntity()).toList(),
      );
    });
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReq order) async {
    var returnedData =
        await sl<OrderFirebaseService>().orderRegistration(order);
    return returnedData.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    var returnedData = await sl<OrderFirebaseService>().removeCartProduct(id);
    return returnedData.fold((error) {
      return Left(error);
    }, (message) {
      return Right(message);
    });
  }
}
