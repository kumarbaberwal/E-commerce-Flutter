// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce/common/bloc/product/products_display_state.dart';
import 'package:ecommerce/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final Usecase useCase;
  ProductsDisplayCubit({
    required this.useCase,
  }) : super(ProductsInitial());

  void displayProducts({dynamic params}) async {
    emit(ProductsLoading());
    var returnedData = await useCase.call(params: params);
    returnedData.fold((error) {
      return Left(emit(ProductsFailure(message: error)));
    }, (data) {
      return Right(emit(ProductsLoaded(productEntity: data)));
    });
  }

  void displayInitial() async {
    emit(ProductsInitial());
  }
}
