import 'package:flutter/material.dart';
import 'package:my_app/todo_list/todo_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABC State',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int age = 100;
  String name = "Freddo";
  bool isToggled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyColumn(
      onPressed: () {
        setState(() {
          isToggled = !isToggled;
          age += 1;
        });
      },
      icon: Icon(isToggled ? Icons.abc : Icons.ac_unit),
      age: age,
    ));
  }
}

class MyColumn extends StatelessWidget {
  late Function onPressed;
  late Icon icon;
  late int age;

  MyColumn({Function? onPressed, Icon? icon, int? age}) {
    this.onPressed = onPressed!;
    this.icon = icon!;
    this.age = age!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(age.toString()),
        IconButton(
          onPressed: () {
            onPressed();
          },
          icon: icon,
        ),
      ],
    );
  }
}
