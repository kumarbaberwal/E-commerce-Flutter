import 'package:flutter_bloc/flutter_bloc.dart';

class ProductSizeSelectionCubit extends Cubit<int> {
  int selectedIndex = 0;

  ProductSizeSelectionCubit() : super(0);
  void itemSelection(int index) {
    selectedIndex = index;
    emit(index);
  }
}
