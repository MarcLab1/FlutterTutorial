import 'package:flutter/material.dart';

void main() {
  runApp(HomeWidget());
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _age = 44;
  String _name = "Tony";
  ValueNotifier _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            NameText(name: _name),
            AgeTextField(age: _age),
            AddIconButtonWidget(add: () {
              setState(() {
                _age++;
                _counter.value++;
              });
            }),
            TextCounterWidget(
              counter: _counter.value,
            )
          ],
        ),
      ),
    );
  }
}

class AddIconButtonWidget extends StatefulWidget {
  final Function add;
  AddIconButtonWidget({super.key, required this.add});

  @override
  State<AddIconButtonWidget> createState() => _AddIconButtonWidgetState();
}

class _AddIconButtonWidgetState extends State<AddIconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          widget.add();
        },
        icon: Icon(Icons.add));
  }
}

class TextCounterWidget extends StatefulWidget {
  final int counter;
  const TextCounterWidget({super.key, required this.counter});

  @override
  State<TextCounterWidget> createState() => _TextCounterWidgetState();
}

class _TextCounterWidgetState extends State<TextCounterWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.counter.toString());
  }
}

class AgeTextField extends StatelessWidget {
  const AgeTextField({
    super.key,
    required int age,
  }) : _age = age;

  final int _age;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(hintText: _age.toString()),
    );
  }
}

class NameText extends StatelessWidget {
  const NameText({
    super.key,
    required String name,
  }) : _name = name;

  final String _name;

  @override
  Widget build(BuildContext context) {
    return Text(_name);
  }
}
