//enum EmployeeEvents { increment, decrement }

import 'package:equatable/equatable.dart';

abstract class EmployeeEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateDislikeEvent extends EmployeeEvents {
  final int current;
  UpdateDislikeEvent({this.current});
}

class UpdateLikeEvent extends EmployeeEvents {
  final int current;
  UpdateLikeEvent({this.current});
}
