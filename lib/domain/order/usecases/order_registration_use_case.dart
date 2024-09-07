import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/data/order/model/order_registration_req.dart';
import 'package:ecommerce/domain/order/repository/order_repository.dart';
import 'package:ecommerce/service_locator.dart';

class OrderRegistrationUseCase
    implements Usecase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? params}) async {
    return await sl<OrderRepository>().orderRegistration(params!);
  }
}
