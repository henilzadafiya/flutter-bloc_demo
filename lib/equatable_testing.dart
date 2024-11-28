import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Person person =Person('henil', 20);
          Person person1 =Person('henil', 20);

          print(person == person1);
          print(person == person);
          print(person.hashCode);
          print(person1.hashCode);

        },
      ),
    );
  }
}


class Person extends Equatable{
  final String name;
  final int age;

  Person(this.name, this.age);

  @override
  List<Object?> get props => [name,age];


}