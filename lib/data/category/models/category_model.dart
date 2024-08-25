import 'dart:convert';

import 'package:ecommerce/domain/category/entity/category_entity.dart';

class CategoryModel {
  final String categoryId;
  final String image;
  final String title;
  CategoryModel({
    required this.categoryId,
    required this.image,
    required this.title,
  });

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryId: map['categoryId'] as String? ?? '',
      image: map['image'] as String? ?? '',
      title: map['title'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'image': image,
      'title': title,
    };
  }
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      image: image,
      title: title,
    );
  }
}
