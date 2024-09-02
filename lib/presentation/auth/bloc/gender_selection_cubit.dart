import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSelectionCubit extends Cubit<int> {
  int selectedIndex = 1;

  GenderSelectionCubit() : super(1);

  void selectGender(int index) {
    selectedIndex = index;
    emit(index);
  }
}
