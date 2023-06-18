import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

/*
  Map students = {'s1': 'Marc', 's2': 'Jin', 's3': 'Austin'};

  students.forEach((key, value) {
    print(value);
  });

  print(students['s1']);
  print(students[0]);
  */
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/first',
      routes: {
        '/': (context) => Loading(),
        '/first': (context) => First(),
        '/second': (context) => Second(),
        '/third': (context) => Third(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
    );
  }
}

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Loading();
  }
}

class _Loading extends State<Loading> {
  void getData() async {
    Response response =
        await get(Uri.https("jsonplaceholder.typicode.com", "todos/1"));
    Map data = jsonDecode(response.body);
    print(data['title']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      throw UnimplementedError();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: Text("loading"));
  }
}

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text("1st"),
        IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, '/second', //navigating with arguments
                  arguments: {'name': 'Bill', 'age': 55});
            },
            icon: Icon(Icons.abc)),
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            icon: Icon(Icons.ac_unit_sharp))
      ],
    ));
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text("2 2 2 2 2 2 2 2 2 2 "),
          backgroundColor: Color.fromARGB(255, 222, 122, 255),
        ),
        body: Column(
          children: [Text("2nd"), Text(map.toString())],
        ));
  }
}

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ThirdPageWidgetState();
  }
}

class _ThirdPageWidgetState extends State<Third> {
  var number = 0;
  var name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(number.toString()),
          backgroundColor: Color.fromARGB(255, 4, 122, 255),
        ),
        body: Column(
          children: [
            Text("3rd"),
            Text("name: $name"),
            IconButton(
              icon: Icon(Icons.abc),
              onPressed: () {
                setState(() {
                  number++;
                });
              },
            ),
          ],
        ));
  }
}
