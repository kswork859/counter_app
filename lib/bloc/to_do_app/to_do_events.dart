import 'package:equatable/equatable.dart';

abstract class ToDoEvents extends Equatable {
  const ToDoEvents();
}

class AddEvent extends ToDoEvents {
  final String tasks;

  const AddEvent({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

class RemoveEvent extends ToDoEvents {
  final Object tasks;

  const RemoveEvent({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}
