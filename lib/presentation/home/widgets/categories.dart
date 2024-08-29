import 'package:cubit_form/cubit_form.dart';
import 'package:ecommerce/common/bloc/categories/categories_display_cubit.dart';
import 'package:ecommerce/common/helper/images/image_display_helper.dart';
import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/domain/category/entity/category_entity.dart';
import 'package:ecommerce/presentation/all_categories/pages/all_categories.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/bloc/categories/categories_display_state.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesDisplayCubit()..displayCategories(),
      child: BlocBuilder<CategoriesDisplayCubit, CategoriesDisplayState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return Column(
              children: [
                _seaAllShimmer(),
                const SizedBox(
                  height: 20,
                ),
                _categoriesShimmer(),
              ],
            );
          }
          if (state is CategoriesLoaded) {
            return Column(
              children: [
                _seaAll(context),
                const SizedBox(
                  height: 20,
                ),
                _categories(state.categories)
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _categories(List<CategoryEntity> categories) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (contetx, index) {
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                          // fit: BoxFit.none,
                          image: NetworkImage(
                        ImageDisplayHelper.generateCategoryImageURL(
                            categories[index].image),
                      ))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  categories[index].title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 14),
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: categories.length),
    );
  }

  Widget _categoriesShimmer() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (contetx, index) {
            return Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 19.2,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 15),
          itemCount: 5),
    );
  }

  Widget _seaAll(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Categories',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, const AllCategoriesPage());
            },
            child: const Text(
              'See All',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  Widget _seaAllShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              height: 16,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              height: 19.2,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
