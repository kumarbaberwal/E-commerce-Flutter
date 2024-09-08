// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/domain/order/entity/order_status_entity.dart';
import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';

class OrderEntity {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.code,
    required this.orderStatus,
  });
}
