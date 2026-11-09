import 'package:counter_app/bloc/to_do_app/to_do_bloc.dart';
import 'package:counter_app/bloc/to_do_app/to_do_events.dart';
import 'package:counter_app/bloc/to_do_app/to_do_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoApp();
}

class _ToDoApp extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("To Do App"))),
      body: BlocBuilder<ToDoBloc, ToDoStates>(
        builder: (context, states) {
          if (states.toDoList.isEmpty) {
            return const Center(child: Text("No Task Found"));
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(states.toDoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<ToDoBloc>().add(
                        RemoveEvent(tasks: states.toDoList[index]),
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
              itemCount: states.toDoList.length,
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<ToDoBloc>().add(AddEvent(tasks: "Task :$i"));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
