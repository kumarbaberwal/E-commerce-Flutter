import 'dart:convert';

import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductOrderedModel {
  final String productId;
  final String productTitle;
  final int productQuantity;
  final String productColor;
  final String productSize;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;
  ProductOrderedModel({
    required this.productId,
    required this.productTitle,
    required this.productQuantity,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.createdDate,
  });

  factory ProductOrderedModel.fromJson(String source) =>
      ProductOrderedModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      productId: map['productId'] as String,
      productTitle: map['productTitle'] as String,
      productQuantity: map['productQuantity'] as int,
      productColor: map['productColor'] as String,
      productSize: map['productSize'] as String,
      productPrice: map['productPrice'] as double,
      totalPrice: map['totalPrice'] as double,
      productImage: map['productImage'] as String,
      createdDate: map['createdDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productTitle': productTitle,
      'productQuantity': productQuantity,
      'productColor': productColor,
      'productSize': productSize,
      'productPrice': productPrice,
      'totalPrice': totalPrice,
      'productImage': productImage,
      'createdDate': createdDate,
    };
  }
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      productId: productId,
      productTitle: productTitle,
      productQuantity: productQuantity,
      productColor: productColor,
      productSize: productSize,
      productPrice: productPrice,
      totalPrice: totalPrice,
      productImage: productImage,
      createdDate: createdDate,
    );
  }
}