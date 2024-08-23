import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AgesDisplayState {}

class AgesLoaded extends AgesDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> ages;

  AgesLoaded({required this.ages});
}

class AgesLoadFailure extends AgesDisplayState {
  final String message;

  AgesLoadFailure({required this.message});
}

class AgesLoading extends AgesDisplayState {}
