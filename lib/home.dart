import 'package:bloc_employee_example/bloc.dart';
import 'package:bloc_employee_example/events.dart';
import 'package:bloc_employee_example/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC Example'),
      ),
      body: Center(
        child: Column(
          children: [
            BlocProvider<EmployeeBloc>(
              create: (BuildContext context) => EmployeeBloc(),
              child: Data(
                id: 101,
                name: 'ABC',
              ),
            ),
            BlocProvider<EmployeeBloc>(
              create: (BuildContext context) => EmployeeBloc(),
              child: Data(
                id: 102,
                name: 'QWE',
              ),
            ),
            BlocProvider<EmployeeBloc>(
              create: (BuildContext context) => EmployeeBloc(),
              child: Data(
                id: 103,
                name: 'ZXC',
              ),
            ),
            BlocProvider<EmployeeBloc>(
              create: (BuildContext context) => EmployeeBloc(),
              child: Data(
                id: 104,
                name: 'PQR',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Data extends StatefulWidget {
  final int id;
  final String name;

  Data({this.id, this.name});

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  int likes = 0;

  int dislikes = 0;

  EmployeeBloc employeeBloc;

  @override
  void initState() {
    super.initState();
    employeeBloc = BlocProvider.of<EmployeeBloc>(context);
  }

  @override
  void dispose() {
    employeeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmployeeBloc, EmployeeStates>(
      listener: (BuildContext context, state) {
        if (state is UpdateLike)
          setState(() => likes = state.likes);
        if (state is UpdateDislike)
          setState(() => dislikes = state.dislikes);
      },
      child: BlocBuilder<EmployeeBloc, EmployeeStates>(
        //cubit: employeeBloc,
        builder: (BuildContext context, state) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('ID: ${widget.id}'),
                Text('Name: ${widget.name}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.thumb_up),
                      onPressed: () => employeeBloc.add(UpdateLikeEvent(current: likes)),
                    ),
                    state is IncrementLoader
                        ? CircularProgressIndicator()
                        : Text('Likes: $likes'),
                    IconButton(
                      icon: Icon(Icons.thumb_down),
                      onPressed: () => employeeBloc.add(UpdateDislikeEvent(current: dislikes)),
                    ),
                    state is DecrementLoader
                        ? CircularProgressIndicator()
                        : Text('Dislikes: $dislikes'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
