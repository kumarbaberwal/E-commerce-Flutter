import 'package:ecommerce/domain/category/entity/category_entity.dart';

abstract class CategoriesDisplayState {}

class CategoriesLoading extends CategoriesDisplayState {}

class CategoriesLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categories;

  CategoriesLoaded({required this.categories});
}

class CategoriesFailure extends CategoriesDisplayState {
  final String message;

  CategoriesFailure({required this.message});
}
