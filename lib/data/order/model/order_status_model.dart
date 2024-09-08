// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/domain/order/entity/order_status_entity.dart';

class OrderStatusModel {
  final String title;
  final bool done;
  final Timestamp createdDate;

  OrderStatusModel(
      {required this.title, required this.done, required this.createdDate});

  factory OrderStatusModel.fromJson(String source) =>
      OrderStatusModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory OrderStatusModel.fromMap(Map<String, dynamic> map) {
    return OrderStatusModel(
      title: map['title'] as String,
      done: map['done'] as bool,
      createdDate: map['createdDate'] as Timestamp,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'done': done,
      'createdDate': createdDate,
    };
  }
}

extension OrderStatusXModel on OrderStatusModel {
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(
      title: title,
      done: done,
      createdDate: createdDate,
    );
  }
}
