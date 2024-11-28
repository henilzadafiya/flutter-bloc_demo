-------------------------------------
1 instance compare 2 instance

@override
bool operator ==(Object other) =>
identical(this, other) ||
other is Person &&
runtimeType == other.runtimeType &&
name == other.name &&
age == other.age;

@override
int get hashCode => name.hashCode ^ age.hashCode;
----------------------------------------------------------------------------------------------------

counter in block

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
---------------------------------------------------------------------------------------------------
