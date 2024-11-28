import 'package:equatable/equatable.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent();
}

class AddToEvent extends ToDoEvent {

  final String task;


  const AddToEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveToEvent extends ToDoEvent {
  final Object task;

  const RemoveToEvent({required this.task});

  @override
  List<Object?> get props => [task];

}