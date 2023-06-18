import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  var todos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init fired");
  }

  @override
  Widget build(BuildContext context) {
    print("build fired");
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          EnterTodo(add: (value) {
            setState(() {
              todos.add(value);
            });
          }),
          Column(
            children: todos.map((todo) {
              return TodoCard(todo, () {
                setState(() {
                  todos.remove(todo);
                });
              });
            }).toList(),
          ),
        ],
      ),
    ));
  }
}

class EnterTodo extends StatefulWidget {
  String value = "";
  Function? add;

  EnterTodo({super.key, this.add});

  @override
  State<EnterTodo> createState() => _EnterTodoState();
}

class _EnterTodoState extends State<EnterTodo> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              widget.add!(_controller.text);
              _controller.clear();
            },
            icon: Icon(Icons.add)),
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: "Enter a todo"),
          ),
        ),
      ],
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class TodoCard extends StatelessWidget {
  late String todo;
  late Function delete;

  TodoCard(String todo, Function delete) {
    this.todo = todo;
    this.delete = delete;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(todo)),
            IconButton(
                onPressed: () {
                  delete();
                },
                icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
