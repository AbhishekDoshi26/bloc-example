import 'package:bloc_employee_example/events.dart';
import 'package:bloc_employee_example/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Bloc<EmployeeEvents, EmployeeStates> {
  EmployeeBloc() : super(InitialState(likes: 0, dislikes: 0));

  int increment(int value) {
    return value + 1;
  }

  int decrement(int value) {
    if (value > 0)
      return value - 1;
    else
      return 0;
  }

  @override
  Stream<EmployeeStates> mapEventToState(EmployeeEvents event) async* {
    if (event is UpdateLikeEvent) {
      yield UpdateLike(likes: event.current);
    }
    if (event is UpdateDislikeEvent)
      yield UpdateDislike(dislikes: event.current);
  }
}
