import 'package:flutter/material.dart';

void main() {
  runApp(HomeWidget());

  Student s1 = Student(name: "Tony", age: 81);
  print(s1.isOld().toString());

  Student s2 = Student(name: "Timmy", age: 33);
  print(s2.isOld().toString());
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<String> _marker = ValueNotifier<String>("");
  Student s1 = Student(name: "Sammy", age: 15);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: OldWidget(s1: s1, marker: _marker));
  }
}

class OldWidget extends StatelessWidget {
  const OldWidget({
    super.key,
    required this.s1,
    required ValueNotifier<String> marker,
  }) : _marker = marker;

  final Student s1;
  final ValueNotifier<String> _marker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      IconButton(
          onPressed: () {
            s1.addTenYears();
            _marker.value += "!";
          },
          icon: Icon(Icons.add)),
      Center(
        child: ValueListenableBuilder(
          valueListenable: s1,
          builder: (context, value, child) {
            return Text(s1.toString() + " " + value.toString());
          },
        ),
      ),
      Center(
        child: ValueListenableBuilder(
            valueListenable: _marker,
            builder: (context, value, child) {
              return Text(_marker.value);
            }),
      ),
    ]));
  }
}

class Student extends ValueNotifier<int> {
  int age;
  String? name;
  Student({required String name, required this.age}) : super(age) {
    this.name = name;
  }

  @override
  String toString() {
    return 'The student named ${this.name} is ${this.age} years old.';
  }

  bool isOld() {
    return this.age >= 80 ? true : false;
  }

  void addTenYears() {
    age += 10;
    notifyListeners();
  }

  void minusYear() {
    age--;
  }
}
