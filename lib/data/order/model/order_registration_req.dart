// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/data/order/model/product_ordered_model.dart';
import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> products;
  final String createdDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderRegistrationReq({
    required this.products,
    required this.createdDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'products': products.map((x) => x.fromEntity().toMap()).toList(),
      'createdDate': createdDate,
      shippingAddress: shippingAddress,
      'itemCount': itemCount,
      'totalPrice': totalPrice,
    };
  }
}
