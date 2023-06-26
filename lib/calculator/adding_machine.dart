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
  String _equation = "";

  String _getResult() {
    int index = _equation.indexOf('+');
    if (index != -1) {
      return (int.parse(_equation.substring(0, index)) +
              int.parse(_equation.substring(index + 1, _equation.length)))
          .toString();
    }

    index = _equation.indexOf('*');
    if (index != -1) {
      return (int.parse(_equation.substring(0, index)) *
              int.parse(_equation.substring(index + 1, _equation.length)))
          .toString();
    }
    return "?";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Text(
              _equation,
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Row(children: [
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "+";
                });
              },
              icon: Text("+")),
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "*";
                });
              },
              icon: Text("*")),
        ]),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _equation = _getResult();
                  });
                },
                icon: Text("=")),
            IconButton(
                onPressed: () {
                  setState(() {
                    _equation = "";
                  });
                },
                icon: Text("C")),
          ],
        ),
        Row(children: [
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "1";
                });
              },
              icon: Text("1")),
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "2";
                });
              },
              icon: Text("2")),
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "3";
                });
              },
              icon: Text("3")),
        ]),
        Row(children: [
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "4";
                });
              },
              icon: Text("4")),
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "5";
                });
              },
              icon: Text("5")),
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "6";
                });
              },
              icon: Text("6")),
        ]),
        Row(children: [
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "7";
                });
              },
              icon: Text("7")),
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "8";
                });
              },
              icon: Text("8")),
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "9";
                });
              },
              icon: Text("9")),
        ]),
        Row(children: [
          IconButton(
              onPressed: () {
                setState(() {
                  _equation += "0";
                });
              },
              icon: Text("0")),
        ]),
      ],
    )));
  }
}
