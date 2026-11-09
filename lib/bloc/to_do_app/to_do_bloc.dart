import 'package:bloc/bloc.dart';
import 'package:counter_app/bloc/to_do_app/to_do_events.dart';
import 'package:counter_app/bloc/to_do_app/to_do_states.dart';

class ToDoBloc extends Bloc<ToDoEvents, ToDoStates> {
  final List<String> toDosList = [];
  ToDoBloc() : super(ToDoStates()) {
    on<AddEvent>(_onAddTask);
    on<RemoveEvent>(_onRemoveTask);
  }
  void _onAddTask(AddEvent event, Emitter<ToDoStates> emit) {
    toDosList.add(event.tasks);
    emit(state.copyWith(toDoList: List.from(toDosList)));
  }

  void _onRemoveTask(RemoveEvent event, Emitter<ToDoStates> emit) {
    toDosList.remove(event.tasks);
    emit(state.copyWith(toDoList: List.from(toDosList)));
  }
}
