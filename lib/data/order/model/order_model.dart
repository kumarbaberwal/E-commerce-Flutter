// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/data/order/model/order_status_model.dart';
import 'package:ecommerce/data/order/model/product_ordered_model.dart';
import 'package:ecommerce/domain/order/entity/order_entity.dart';

class OrderModel {
  final List<ProductOrderedModel> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      products: map['products'] != null
          ? List<ProductOrderedModel>.from(
              map['products'].map((e) => ProductOrderedModel.fromMap(e)))
          : [], // Default to an empty list if null
      createdDate: map['createdDate'] ?? '', // Default to empty string if null
      shippingAddress: map['shippingAddress'] ?? '', // Same for shippingAddress
      itemCount: map['itemCount'] ?? 0, // Default to 0 if null
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0, // Ensure it's a double
      code: map['code'] ?? '', // Default to empty string if null
      orderStatus: map['orderStatus'] != null
          ? List<OrderStatusModel>.from(
              map['orderStatus'].map((e) => OrderStatusModel.fromMap(e)))
          : [], // Default to an empty list if null
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.toMap()).toList(),
      'createdDate': createdDate,
      'shippingAddress': shippingAddress,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
      'code': code,
      'orderStatus': orderStatus.map((x) => x.toMap()).toList(),
    };
  }
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      products: products.map((e) => e.toEntity()).toList(),
      createdDate: createdDate,
      shippingAddress: shippingAddress,
      itemCount: itemCount,
      totalPrice: totalPrice,
      code: code,
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
