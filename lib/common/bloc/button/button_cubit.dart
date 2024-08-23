import 'package:cubit_form/cubit_form.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/common/bloc/button/button_state.dart';
import 'package:ecommerce/core/usecase/usecase.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required Usecase usecase}) async {
    emit(ButtonLoadingState());

    try {
      Either returnedData = await usecase.call(params: params);
      return returnedData.fold((error) {
        ButtonFailureState(errorMessage: error);
      }, (data) {
        ButtonSuccessState();
      });
    } catch (e) {
      ButtonFailureState(errorMessage: e.toString());
    }
  }
}
