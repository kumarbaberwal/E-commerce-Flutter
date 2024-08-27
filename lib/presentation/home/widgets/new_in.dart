import 'package:cubit_form/cubit_form.dart';
import 'package:ecommerce/common/bloc/product/products_display_cubit.dart';
import 'package:ecommerce/common/bloc/product/products_display_state.dart';
import 'package:ecommerce/common/widgets/product/product_card.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/domain/product/usecases/get_new_in_use_case.dart';
import 'package:flutter/material.dart';
import '../../../service_locator.dart';


class NewIn extends StatelessWidget {
  const NewIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsDisplayCubit(useCase: sl<GetNewInUseCase>())..displayProducts(),
      child: BlocBuilder < ProductsDisplayCubit, ProductsDisplayState > (
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const CircularProgressIndicator();
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _newIn(),
                const SizedBox(height: 20, ),
                _products(state.productEntity)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

   Widget _newIn() {
    return const Padding(
      padding: EdgeInsets.symmetric(
         horizontal: 16,
       ),
      child: Text(
        'New In',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.primary 
        ),
      ),
    );
  }

   Widget _products(List<ProductEntity> products) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
         horizontal: 16,
       ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          return ProductCard(
            productEntity: products[index],
          );
        },
        separatorBuilder: (context,index) => const SizedBox(width: 10,),
        itemCount: products.length
        ),
    );
  }
}