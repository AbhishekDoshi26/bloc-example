import 'package:equatable/equatable.dart';

abstract class EmployeeStates extends Equatable {}

class InitialState extends EmployeeStates {
  final int likes;
  final int dislikes;
  InitialState({this.likes, this.dislikes});

  @override
  List<Object> get props => [likes, dislikes];
}

class UpdateDislike extends EmployeeStates {
  final int dislikes;
  UpdateDislike({this.dislikes});

  @override
  List<Object> get props => [dislikes];
}

class UpdateLike extends EmployeeStates {
  final int likes;
  UpdateLike({this.likes});

  @override
  List<Object> get props => [likes];
}

class IncrementLoader extends EmployeeStates {
  @override
  List<Object> get props => [];
}

class DecrementLoader extends EmployeeStates {
  @override
  List<Object> get props => [];
}
