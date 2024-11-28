import 'package:bloc/bloc.dart';
import 'package:flutter_block_demo_practice/bloc/todo/to_do_event.dart';
import 'package:flutter_block_demo_practice/bloc/todo/to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  final List<String> todosList = [];

  ToDoBloc() : super(ToDoState()) {
    on<AddToEvent>(_addToDoEvent);
    on<RemoveToEvent>(_removeToDoEvent);
  }

  void _addToDoEvent(AddToEvent event, Emitter<ToDoState> emit) {
    todosList.add(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }

  void _removeToDoEvent(RemoveToEvent event , Emitter<ToDoState> emit) {
    todosList.remove(event.task);
    emit(state.copyWith(todosList: List.from(todosList)));
  }
}
