import 'package:ecommerce/domain/order/entity/product_ordered_entity.dart';
import 'package:ecommerce/domain/order/usecases/get_cart_products_use_case.dart';
import 'package:ecommerce/domain/order/usecases/remove_cart_product_use_case.dart';
import 'package:ecommerce/presentation/cart/bloc/cart_products_display_state.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductsDisplayCubit extends Cubit<CartProductsDisplayState> {
  CartProductsDisplayCubit() : super(CartProductsLoading());
  void displayCartProducts() async {
    var returnedData = await sl<GetCartProductsUseCase>().call();
    return returnedData.fold((error) {
      emit(CartProductsFailure(errorMessage: error));
    }, (data) {
      emit(CartProductsLoaded(products: data));
    });
  }

  void removeCartProduct(ProductOrderedEntity product) async {
    emit(CartProductsLoading());
    var returnedData =
        await sl<RemoveCartProductUseCase>().call(params: product.id);
    return returnedData.fold((error) {
      emit(CartProductsFailure(errorMessage: error));
    }, (data) {
      displayCartProducts();
    });
  }
}
