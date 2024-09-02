import 'package:ecommerce/domain/auth/usecases/get_user_use_case.dart';
import 'package:ecommerce/presentation/home/bloc/user_info_display_state.dart';
import 'package:ecommerce/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUseCase>().call();
    returnedData.fold((error) {
      emit(UserInfoFailure(message: error));
    }, (data) {
      emit(UserInfoLoaded(user: data));
    });
  }
}
