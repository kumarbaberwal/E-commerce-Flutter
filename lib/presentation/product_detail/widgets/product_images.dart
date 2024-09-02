// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/common/helper/images/image_display_helper.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImages({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    ImageDisplayHelper.generateProductImageURL(
                        productEntity.images[index]),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: productEntity.images.length),
    );
  }
}
