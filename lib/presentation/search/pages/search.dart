import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/domain/product/usecases/get_products_by_title_use_case.dart';
import 'package:ecommerce/presentation/search/widgets/search_field.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:svg_flutter/svg.dart';

import '../../../common/bloc/product/products_display_cubit.dart';
import '../../../common/bloc/product/products_display_state.dart';
import '../../../common/widgets/product/product_card.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsDisplayCubit(useCase: sl<GetProductsByTitleUseCase>()),
      child: Scaffold(
        appBar: BasicAppbar(height: 80, title: SearchField()),
        body: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return _productsShimmer();
            }
            if (state is ProductsLoaded) {
              return state.productEntity.isEmpty
                  ? _notFound()
                  : _products(state.productEntity);
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _notFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppVectors.notFound,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            "Sorry, we couldn't find any matching result for your Search.",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        )
      ],
    );
  }

  Widget _products(List<ProductEntity> products) {
    return GridView.builder(
      itemCount: products.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6),
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(productEntity: products[index]);
      },
    );
  }

  Widget _productsShimmer() {
    return GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return Container(
              width: 180,
              decoration: BoxDecoration(
                color: AppColors.secondBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.white,
                    child: Container(
                      height: 230, // Adjust the height as needed
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 14.4,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              child: Container(
                                height: 14.4,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.white,
                              child: Container(
                                height: 14.4,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
