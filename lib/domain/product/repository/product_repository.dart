import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';

abstract class ProductRepository {
  Future<Either> addOrRemoveFavoriteProduct(ProductEntity productEntity);
  Future<bool> isFavorite(String productId);
  Future<Either> getNewIn();
  Future<Either> getProductsByCategoryId(String categoryId);
  Future<Either> getProductsByTitle(String title);
  Future<Either> getTopSelling();
  Future<Either> getFavoritesProducts();
}
