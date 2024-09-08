import 'package:ecommerce/domain/product/entity/product_entity.dart';
import 'package:ecommerce/domain/product/usecases/add_or_remove_favorite_product_use_case.dart';
import 'package:ecommerce/domain/product/usecases/is_favorite_use_case.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);
  void isFavorite(String productId) async {
    var result = await sl<IsFavoriteUseCase>().call(params: productId);
    emit(result);
  }

  void onTap(ProductEntity productEntity) async {
    var result = await sl<AddOrRemoveFavoriteProductUseCase>()
        .call(params: productEntity);
    result.fold((error) {}, (data) {
      return emit(data);
    });
  }
}
