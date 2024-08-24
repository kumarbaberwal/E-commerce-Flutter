import 'package:cubit_form/cubit_form.dart';
import 'package:ecommerce/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    emit(UnAuthenticated());
  }
}
