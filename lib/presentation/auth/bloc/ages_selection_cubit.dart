import 'package:cubit_form/cubit_form.dart';

class AgeSelectionCubit extends Cubit<String> {
  String selectedAge = '';

  AgeSelectionCubit() : super('Age Range');

  void selectAge(String age) {
    selectedAge = age;
    emit(age);
  }
}
