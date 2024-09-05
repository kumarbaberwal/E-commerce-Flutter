import 'package:ecommerce/common/bloc/button/button_cubit.dart';
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/helper/product/product_price_helper.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/data/order/model/add_to_cart_req.dart';
import 'package:ecommerce/domain/order/usecases/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/cart/pages/cart_page.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBag extends StatelessWidget {
  final ProductEntity productEntity;
  const AddToBag({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonSuccessState) {
          AppNavigator.push(context, const CartPage());
        }
        if (state is ButtonFailureState) {
          var snackbar = SnackBar(
            content: Text(state.errorMessage),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BasicReactiveButton(
            onPressed: () {
              context.read<ButtonCubit>().execute(
                  usecase: AddToCartUseCase(),
                  params: AddToCartReq(
                      productId: productEntity.productId,
                      productTitle: productEntity.title,
                      productQuantity:
                          context.read<ProductQuantityCubit>().state,
                      productColor: productEntity
                          .colors[context
                              .read<ProductColorSelectionCubit>()
                              .selectedIndex]
                          .title,
                      productSize: productEntity.sizes[context
                          .read<ProductSizeSelectionCubit>()
                          .selectedIndex],
                      productPrice: productEntity.price.toDouble(),
                      totalPrice: ProductPriceHelper.provideCurrentPrice(
                              productEntity) *
                          context.read<ProductQuantityCubit>().state,
                      productImage: productEntity.images[0],
                      createdDate: DateTime.now().toString()));
            },
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<ProductQuantityCubit, int>(
                  builder: (context, state) {
                    var price =
                        ProductPriceHelper.provideCurrentPrice(productEntity) *
                            state;
                    return Text(
                      "\$${price.toString()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14),
                    );
                  },
                ),
                const Text(
                  'Add to Bag',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 14),
                ),
              ],
            )),
      ),
    );
  }
}
