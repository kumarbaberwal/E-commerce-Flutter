import 'package:ecommerce/domain/product/entity/product_entity.dart';

abstract class ProductsDisplayState {}

class ProductsLoading extends ProductsDisplayState {}

class ProductsLoaded extends ProductsDisplayState {
  final List<ProductEntity> productEntity;

  ProductsLoaded({required this.productEntity});
}

class ProductsFailure extends ProductsDisplayState {
  final String message;

  ProductsFailure({required this.message});
}
