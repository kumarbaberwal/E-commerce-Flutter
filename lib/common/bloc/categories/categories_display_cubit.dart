import 'package:cubit_form/cubit_form.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/common/bloc/categories/categories_display_state.dart';
import 'package:ecommerce/domain/category/usecases/get_category_use_case.dart';
import 'package:ecommerce/service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoryUseCase>().call();
    returnedData.fold((error) {
      return Left(emit(CategoriesFailure(message: error)));
    }, (data) {
      return Right(emit(CategoriesLoaded(categories: data)));
    });
  }
}
