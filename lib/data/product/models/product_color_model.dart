import 'dart:convert';

import 'package:ecommerce/domain/product/entity/product_color_entity.dart';

class ProductColorModel {
  final String title;
  final String hexCode;

  ProductColorModel({required this.title, required this.hexCode});

  factory ProductColorModel.fromJson(String source) =>
      ProductColorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
    return ProductColorModel(
      title: map['title'] as String? ?? '',
      hexCode: map['hexCode'] as String? ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'hexCode': hexCode,
    };
  }
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      hexCode: hexCode,
    );
  }
}
