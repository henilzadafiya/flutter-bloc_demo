import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/todo/to_do_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/todo/to_do_event.dart';
import 'package:flutter_block_demo_practice/bloc/todo/to_do_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Example"),
      ),
      body: BlocBuilder<ToDoBloc, ToDoState>(
        builder: (context, state) {
          if (state.todosList.isEmpty) {
            return Center(
              child: Text("No todo found"),
            );
          } else if (state.todosList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${state.todosList[index]}"),
                  trailing: IconButton(
                      onPressed: () {
                        context.read<ToDoBloc>().add(RemoveToEvent(task: state.todosList[index]));
                      }, icon: const Icon(Icons.delete)),
                );
              },
            );
          }
          else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          for (int i = 0; i < 5; i++) {
            context.read<ToDoBloc>().add(AddToEvent(task:'Task : ' + i.toString()));
          }
        },
      ),
    );
  }
}
