import 'package:ecommerce/common/helper/cart/cart_helper.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/button/basic_app_button.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';
import 'package:ecommerce/presentation/cart/pages/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Checkout extends StatelessWidget {
  final List<ProductOrderedEntity>? products;
  final bool isLoading;
  const Checkout({this.products, super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height / 3.5,
      color: AppColors.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isLoading ? buildShimmerRow('Subtotal') : buildSubtotalRow(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping Cost',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$8',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              Text(
                '\$0.0',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              )
            ],
          ),
          isLoading ? buildShimmerRow('Total') : buildTotalRow(),
          isLoading
              ? buildShimmerButton()
              : BasicAppButton(
                  onPressed: () {
                    AppNavigator.push(
                        context,
                        CheckOutPage(
                          products: products!,
                        ));
                  },
                  title: 'Checkout',
                ),
        ],
      ),
    );
  }

  Widget buildShimmerButton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.grey.shade300,),
      ),
    );
  }

  Widget buildShimmerRow(String label) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 16,
            color: Colors.grey[300],
          ),
          Container(
            width: 50,
            height: 16,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }

  Widget buildSubtotalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Subtotal',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        Text(
          '\$${CartHelper.calculateCartSubtotal(products!).toString()}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget buildTotalRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Total',
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        Text(
          '\$${CartHelper.calculateCartSubtotal(products!) + 8}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
