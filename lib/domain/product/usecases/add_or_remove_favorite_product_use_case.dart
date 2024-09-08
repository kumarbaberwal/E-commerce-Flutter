import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/domain/product/repository/product_repository.dart';
import 'package:ecommerce/service_locator.dart';

class AddOrRemoveFavoriteProductUseCase extends Usecase<Either, ProductEntity> {
  @override
  Future<Either> call({ProductEntity? params}) async {
    return await sl<ProductRepository>().addOrRemoveFavoriteProduct(params!);
  }
}
