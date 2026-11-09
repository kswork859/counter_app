import 'package:equatable/equatable.dart';

class ToDoStates extends Equatable {
  final List<String> toDoList;

  const ToDoStates({this.toDoList = const []});

  ToDoStates copyWith({List<String>? toDoList}) {
    return ToDoStates(toDoList: toDoList ?? this.toDoList);
  }

  @override
  List<Object> get props => [toDoList];
}
