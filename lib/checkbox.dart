import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(children: [
      MyCheckBox(
        checked: rememberMe,
        changed: (newValue) {
          setState(() {
            rememberMe = newValue;
          });
        },
      ),
      CheckboxListTile(
        title: Text("Stateful = " + rememberMe.toString()),
        value: rememberMe,
        onChanged: (newValue) {
          setState(() {
            rememberMe = newValue!;
          });
        },
      )
    ])));
  }
}

class MyCheckBox extends StatelessWidget {
  late bool? checked;
  late Function? changed;

  MyCheckBox({bool? checked, Function? changed}) {
    this.checked = checked!;
    this.changed = changed!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Stateless = " + checked.toString()),
        Checkbox(
            value: checked,
            onChanged: (value) {
              changed!(value);
            }),
      ],
    );
  }
}
