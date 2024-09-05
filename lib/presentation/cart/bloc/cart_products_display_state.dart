import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';

abstract class CartProductsDisplayState {}

class CartProductsFailure extends CartProductsDisplayState {
  final String errorMessage;

  CartProductsFailure({required this.errorMessage});
}

class CartProductsLoaded extends CartProductsDisplayState {
  final List<ProductOrderedEntity> products;

  CartProductsLoaded({required this.products});
}

class CartProductsLoading extends CartProductsDisplayState {}
