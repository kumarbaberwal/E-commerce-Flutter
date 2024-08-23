import 'package:cubit_form/cubit_form.dart';

class GenderSelectionCubit extends Cubit<int> {
  int selectedIndex = 1;

  GenderSelectionCubit() : super(1);

  void selectGender(int index) {
    selectedIndex = index;
    emit(index);
  }
}
