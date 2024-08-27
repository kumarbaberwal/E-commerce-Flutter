import 'package:cubit_form/cubit_form.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/domain/product/usecases/get_top_selling_use_case.dart';
import 'package:ecommerce/presentation/home/bloc/top_selling_display_state.dart';
import 'package:ecommerce/service_locator.dart';

class TopSellingDisplayCubit extends Cubit<TopSellingDisplayState> {
  TopSellingDisplayCubit() : super(ProductsLoading());

  void displayProducts() async {
    var returnedData = await sl<GetTopSellingUseCase>().call();
    returnedData.fold((error) {
      return Left(emit(ProductsFailure(message: error)));
    }, (data) {
      return Right(emit(ProductsLoaded(productEntity: data)));
    });
  }
}
