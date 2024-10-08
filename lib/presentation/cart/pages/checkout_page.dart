import 'package:ecommerce/common/bloc/button/button_cubit.dart';
import 'package:ecommerce/common/helper/cart/cart_helper.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/common/widgets/button/basic_reactive_button.dart';
import 'package:ecommerce/data/order/model/order_registration_req.dart';
import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';
import 'package:ecommerce/domain/order/usecases/order_registration_use_case.dart';
import 'package:ecommerce/presentation/cart/pages/order_placed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_state.dart';
import '../../../common/widgets/appbar/app_bar.dart';

class CheckOutPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  final TextEditingController _addressCon = TextEditingController();

  CheckOutPage({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Checkout'),
      ),
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState) {
              AppNavigator.pushAndRemoveUntil(context, const OrderPlacedPage());
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
            child: Builder(builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _addressField(context),
                  BasicReactiveButton(
                    content: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${CartHelper.calculateCartSubtotal(products)}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          const Text(
                            'Place Order',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          )
                        ],
                      ),
                    ),
                    onPressed: () {
                      context.read<ButtonCubit>().execute(
                            usecase: OrderRegistrationUseCase(),
                            params: OrderRegistrationReq(
                              products: products,
                              createdDate: DateTime.now().toString(),
                              itemCount: products.length,
                              totalPrice:
                                  CartHelper.calculateCartSubtotal(products),
                              shippingAddress: _addressCon.text,
                            ),
                          );
                    },
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _addressField(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      controller: _addressCon,
      minLines: 2,
      maxLines: 4,
      decoration: const InputDecoration(hintText: 'Shipping Address'),
    );
  }
}
