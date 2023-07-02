import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(HomeWidget());
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/todolist',
      routes: {
        '/todolist': (context) => TodoListWidget(),
        '/detail': (context) => TodoDetailScreen(),
      },
    );
  }
}

class TodoListWidget extends StatefulWidget {
  List<Todo> todos = [];
  TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          AddTodo(addTodo: (todo) {
            setState(() {
              widget.todos.add(todo);
            });
          }),
          widget.todos.isEmpty
              ? Center(
                  child: Text("no todos yet"),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.todos.length,
                  itemBuilder: (context, index) {
                    return TodoItem(
                      index: index,
                      todo: widget.todos[index],
                      deleteTodo: (todo) {
                        setState(() {
                          widget.todos.remove(todo);
                        });
                      },
                      changeCompleted: (value) {
                        widget.todos[index].changeCompleted();
                      },
                    );
                  })
        ],
      ),
    ));
  }
}

class AddTodo extends StatefulWidget {
  final Function addTodo;
  AddTodo({super.key, required Function this.addTodo});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        controller: _controller,
      ),
      IconButton(
          onPressed: () {
            widget.addTodo(Todo(
                todo: _controller.text,
                date: DateTime.now(),
                isCompleted: false));
            _controller.text = "";
          },
          icon: Icon(Icons.add))
    ]);
  }
}

class TodoItem extends StatefulWidget {
  final int index;
  final Todo todo;
  final Function deleteTodo;
  final Function changeCompleted;

  TodoItem(
      {super.key,
      required this.index,
      required this.todo,
      required this.deleteTodo,
      required this.changeCompleted});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    bool isCompleted = widget.todo.isCompleted;

    return ListTile(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/detail',
            arguments: Todo(
                todo: widget.todo.todo,
                date: widget.todo.date,
                isCompleted: widget.todo.isCompleted),
          );
        },
        leading: Checkbox(
            value: isCompleted,
            onChanged: (value) {
              setState(() {
                widget.changeCompleted(value);
              });
            }),
        title: Text(widget.todo.todo),
        subtitle: Text(widget.todo.getFormattedDate()),
        trailing: IconButton(
            onPressed: () {
              setState(() {
                widget.deleteTodo(widget.todo);
              });
            },
            icon: Icon(Icons.delete)));
    /*
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: Todo(
              todo: widget.todo.todo,
              date: widget.todo.date,
              isCompleted: widget.todo.isCompleted),
        );
        print("pressed");
      },
      child: Row(
        children: [
          const Padding(padding: EdgeInsets.only(left: 5)),
          Text(widget.index.toString()),
          const Padding(padding: EdgeInsets.only(left: 5)),
          Expanded(child: Text(widget.todo.toString())),
          Text(widget.todo.isCompleted.toString()),
          const Padding(padding: EdgeInsets.only(left: 5)),
          IconButton(
              onPressed: () {
                setState(() {
                  widget.deleteTodo(widget.todo);
                });
              },
              icon: Icon(Icons.delete)),
          Checkbox(
              value: isCompleted,
              onChanged: (value) {
                setState(() {
                  widget.changeCompleted(value);
                });
              }),
          const Padding(padding: EdgeInsets.only(left: 5)),
        ],
      ),
    );
    */
  }
}

class Todo {
  String todo;
  DateTime date;
  bool isCompleted;
  Todo({required this.todo, required this.date, required this.isCompleted});

  changeCompleted() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return this.todo + '\n' + getFormattedDate();
  }

  String getFormattedDate() {
    return DateFormat('MMM dd, yyyy hh:mm').format(this.date);
  }
}

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Todo;

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text(args.toString()),
          Checkbox(value: args.isCompleted, onChanged: null),
        ],
      )),
    );
  }
}
