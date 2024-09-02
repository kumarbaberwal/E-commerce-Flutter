// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_color_selection_cubit.dart';
import 'package:ecommerce/presentation/product_detail/bloc/product_quantity_cubit.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_colors.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_images.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_price.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_quantity.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_sizes.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({
    super.key,
    required this.productEntity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductQuantityCubit(),
        ),
        BlocProvider(
          create: (context) => ProductColorSelectionCubit(),
        ),
      ],
      child: Scaffold(
        appBar: const BasicAppbar(
          hideBack: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImages(productEntity: productEntity),
              const SizedBox(
                height: 10,
              ),
              ProductTitle(productEntity: productEntity),
              const SizedBox(
                height: 10,
              ),
              ProductPrice(productEntity: productEntity),
              const SizedBox(
                height: 10,
              ),
              ProductSizes(productEntity: productEntity),
              const SizedBox(
                height: 10,
              ),
              ProductQuantity(productEntity: productEntity),
              const SizedBox(
                height: 10,
              ),
              ProductColors(productEntity: productEntity),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
