import 'package:ecommerce/common/bloc/button/button_cubit.dart';
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_size_selection_cubit.dart';
import 'package:ecommerce/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/product_images.dart';
import '../widgets/product_price.dart';
import '../widgets/product_quantity.dart';
import '../widgets/product_title.dart';
import '../widgets/selected_color.dart';
import '../widgets/selected_size.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({required this.productEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductQuantityCubit()),
        BlocProvider(create: (context) => ProductColorSelectionCubit()),
        BlocProvider(create: (context) => ProductSizeSelectionCubit()),
        BlocProvider(create: (context) => ButtonCubit()),
        // BlocProvider(create: (context) => FavoriteIconCubit()..isFavorite(productEntity.productId))
      ],
      child: Scaffold(
        appBar: const BasicAppbar(
          hideBack: false,
          // action: FavoriteButton(
          //   productEntity: productEntity,
          // ),
        ),
        bottomNavigationBar: AddToBag(
          productEntity: productEntity,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(
                productEntity: productEntity,
              ),
              const SizedBox(
                height: 10,
              ),
              ProductTitle(
                productEntity: productEntity,
              ),
              const SizedBox(
                height: 10,
              ),
              ProductPrice(
                productEntity: productEntity,
              ),
              const SizedBox(
                height: 20,
              ),
              SelectedSize(
                productEntity: productEntity,
              ),
              const SizedBox(
                height: 15,
              ),
              SelectedColor(
                productEntity: productEntity,
              ),
              const SizedBox(
                height: 15,
              ),
              ProductQuantity(
                productEntity: productEntity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
