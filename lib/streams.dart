import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyWidgetState();
  }
}

class _MyWidgetState extends State<MyWidget> {
  int userId = 0;

  @override
  void initState() {
    // TODO: implement initState

    var stream = getNumbersStream();
    stream.listen((event) {
      //print("Event = " + event.toString());
      setState(() {
        userId = event;
      });
    });
  }

  Stream<int> getNumbersStream() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield (i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Column(
          children: [
            Text(
              userId.toString(),
              textDirection: TextDirection.ltr,
            ),
          ],
        ));
  }
}

class Doggy {
  late String name;
  late int age;
  Doggy(String name, int age) {
    this.name = name;
    this.age = age;
  }
}
