import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
    getTime();
  }

  Future<void> getTime() async {
    Response response =
        await get(Uri.https("jsonplaceholder.typicode.com", "todos/1"));
    Map data = jsonDecode(response.body);

    setState(() {
      userId = data['userId'];
    });
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
