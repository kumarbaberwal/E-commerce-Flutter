import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/presentation/cart/bloc/cart_products_display_cubit.dart';
import 'package:ecommerce/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('Cart'),
      ),
      body: BlocProvider(
        create: (context) => CartProductsDisplayCubit()..displayCartProducts(),
        child: BlocBuilder<CartProductsDisplayCubit, CartProductsDisplayState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CartProductsLoaded) {
              return Container();
            }
            if (state is CartProductsFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
