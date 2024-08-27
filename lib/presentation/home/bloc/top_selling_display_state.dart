import 'package:ecommerce/domain/product/entity/product_entity.dart';

abstract class TopSellingDisplayState {}

class ProductsLoading extends TopSellingDisplayState {}

class ProductsLoaded extends TopSellingDisplayState {
  final List<ProductEntity> productEntity;

  ProductsLoaded({required this.productEntity});
}

class ProductsFailure extends TopSellingDisplayState {
  final String message;

  ProductsFailure({required this.message});
}
