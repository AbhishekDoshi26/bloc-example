import 'package:bloc_employee_example/events.dart';
import 'package:bloc_employee_example/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeeBloc extends Bloc<EmployeeEvents, EmployeeStates> {
  EmployeeBloc() : super(InitialState(likes: 0, dislikes: 0));

  Stream<EmployeeStates> likeFunction(int data) async* {
    yield IncrementLoader();
    // await Future.delayed(Duration(seconds: 5));
    yield UpdateLike(likes: data + 1);
  }

  Stream<EmployeeStates> dislikeFunction(int data) async* {
    yield DecrementLoader();
    // await Future.delayed(Duration(seconds: 5));
    yield UpdateDislike(dislikes: data + 1);
  }

  @override
  Stream<EmployeeStates> mapEventToState(EmployeeEvents event) async* {
    if (event is UpdateLikeEvent) yield* likeFunction(event.current);
    if (event is UpdateDislikeEvent) yield* dislikeFunction(event.current);
  }
}
