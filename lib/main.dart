import 'package:flutter/material.dart';
import 'package:flutter_block_demo_practice/bloc/counter/counter_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/switch_example/switch_bloc.dart';
import 'package:flutter_block_demo_practice/bloc/todo/to_do_bloc.dart';
import 'package:flutter_block_demo_practice/repository/favourite_repository.dart';
import 'package:flutter_block_demo_practice/ui/counter_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block_demo_practice/ui/favourite_app/favourite_app_screen.dart';
import 'package:flutter_block_demo_practice/ui/image_picker/image_picker_screen.dart';
import 'package:flutter_block_demo_practice/ui/posts/posts_screen.dart';
import 'package:flutter_block_demo_practice/ui/switchexample/switch_example_screen.dart';
import 'package:flutter_block_demo_practice/ui/todo/todo_screen.dart';
import 'package:flutter_block_demo_practice/utils/image_picker_utils.dart';
import 'bloc/posts/posts_bloc.dart';
import 'equatable_testing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc(),),
        BlocProvider(create: (context) => SwitchBloc(),),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils()),),
        BlocProvider(create: (context) => ToDoBloc(),),
        BlocProvider(create: (context) => FavouriteBlock(FavoriteRepository()),),
        BlocProvider(create: (context) => PostsBloc(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: PostsScreen(),
      ),
    );
  }
}

