import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/product/models/product_model.dart';
import 'package:ecommerce/data/product/source/product_firebase_service.dart';
import 'package:ecommerce/domain/product/repository/product_repository.dart';
import 'package:ecommerce/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getNewIn() async {
    var returnedData = await sl<ProductFirebaseService>().getNewIn();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(
        List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
      );
    });
  }

  @override
  Future<Either> getProductsByCategoryId(String categoryId) async {
    var returnedData =
        await sl<ProductFirebaseService>().getProductsByCategoryId(categoryId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => ProductModel.fromMap(e).toEntity())
          .toList());
    });
  }

  @override
  Future<Either> getTopSelling() async {
    var returnedData = await sl<ProductFirebaseService>().getTopSelling();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(
        List.from(data).map((e) => ProductModel.fromMap(e).toEntity()).toList(),
      );
    });
  }
}
