import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  String selectedAge = '';

  AgeSelectionCubit() : super('Age Range');

  void selectAge(String age) {
    selectedAge = age;
    emit(age);
  }
}
