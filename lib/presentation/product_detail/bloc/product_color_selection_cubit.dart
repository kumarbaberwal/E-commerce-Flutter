import 'package:flutter_bloc/flutter_bloc.dart';

class ProductColorSelectionCubit extends Cubit<int> {
  int selectedIndex = 0;

  ProductColorSelectionCubit() : super(0);
  void itemSelection(int index) {
    selectedIndex = index;
    emit(index);
  }
}
