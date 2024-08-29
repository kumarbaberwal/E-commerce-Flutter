// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cubit_form/cubit_form.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/common/bloc/product/products_display_state.dart';
import 'package:ecommerce/core/usecase/usecase.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final Usecase useCase;
  ProductsDisplayCubit({
    required this.useCase,
  }) : super(ProductsLoading());

  void displayProducts({dynamic params}) async {
    var returnedData = await useCase.call(params: params);
    returnedData.fold((error) {
      return Left(emit(ProductsFailure(message: error)));
    }, (data) {
      return Right(emit(ProductsLoaded(productEntity: data)));
    });
  }
}
