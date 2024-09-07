import 'package:ecommerce/common/helper/images/image_display_helper.dart';
import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';
import 'package:ecommerce/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/configs/theme/app_colors.dart';

class ProductOrderedCard extends StatelessWidget {
  final ProductOrderedEntity? productOrderedEntity; // Allow null for shimmer
  final bool isLoading;

  const ProductOrderedCard({
    this.productOrderedEntity,
    this.isLoading = false, // Default isLoading to false
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: isLoading
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        )
                      : Container(
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                ImageDisplayHelper.generateProductImageURL(
                                  productOrderedEntity!.productImage,
                                ),
                              ),
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 6,
                  child: isLoading
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 16,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 60,
                                height: 10,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productOrderedEntity!.productTitle,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              children: [
                                Text.rich(
                                  overflow: TextOverflow.ellipsis,
                                  TextSpan(
                                    text: 'Size - ',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: productOrderedEntity!.productSize,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text.rich(
                                  overflow: TextOverflow.ellipsis,
                                  TextSpan(
                                    text: 'Color - ',
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            productOrderedEntity!.productColor,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                isLoading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 50,
                          height: 14,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        '\$${productOrderedEntity!.totalPrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                isLoading
                    ? Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 23,
                          width: 23,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          context
                              .read<CartProductsDisplayCubit>()
                              .removeCartProduct(productOrderedEntity!);
                        },
                        child: Container(
                          height: 23,
                          width: 23,
                          decoration: const BoxDecoration(
                            color: Color(0xffFF8383),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.remove,
                            size: 15,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
