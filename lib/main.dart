import 'package:flutter/material.dart';
import 'package:flutter_block_demo_practice/bloc/counter/counter_bloc.dart';
import 'package:flutter_block_demo_practice/ui/counter_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'equatable_testing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CounterScreen(),
      ),
    );
  }
}
