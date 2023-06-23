import 'dart:math';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

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
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late final TextEditingController myController;
  @override
  void initState() {
    myController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        MyButton(onClick: () {
          setState(() {
            myController.text = "";
          });
        }),
        MyTextBox(text: myController.text),
        MyStatefulTextField(
          onTypedText: (newText) {
            setState(() {
              myController.text = newText;
            });
          },
          textController: myController,
        ),
        MyHookWidget(
          onTypedText: (newText) {
            setState(() {
              myController.text = newText;
            });
          },
        ),
        //Memory leak because you are passing textController to a stateless widget
        MyStatelessTextField(
          onTypedText: (newText) {
            setState(() {
              myController.text = newText;
            });
          },
          textController: myController,
        )
      ]),
    );
  }
}

class MyButton extends StatelessWidget {
  late Function onClick;
  late var rando;
  MyButton({super.key, required Function onClick}) {
    this.onClick = onClick;
    rando = Random();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onClick();
        },
        child: Text("reset  \n" + rando.nextInt(100).toString()));
  }
}

class MyStatefulTextField extends StatefulWidget {
  late Function onTypedText;
  late TextEditingController myController;
  MyStatefulTextField(
      {super.key,
      required Function onTypedText,
      required TextEditingController textController}) {
    this.onTypedText = onTypedText;
    this.myController = textController;
  }

  @override
  State<MyStatefulTextField> createState() => _MyStatefulTextFieldState();
}

class _MyStatefulTextFieldState extends State<MyStatefulTextField> {
  var number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final rando = Random();
    number = rando.nextInt(100).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 500,
        child: TextField(
          controller: widget.myController,
          onChanged: (text) {
            widget.onTypedText(text);
            // widget.myController.selection = TextSelection.fromPosition(
            //   TextPosition(offset: widget.myController.text.length));
          },
        ),
      ),
      Text(number)
    ]);
  }
}

class MyTextBox extends StatefulWidget {
  late String text;
  MyTextBox({super.key, required String text}) {
    this.text = text;
  }

  @override
  State<MyTextBox> createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text);
  }
}

class MyStatelessTextField extends StatelessWidget {
  late Function onTypedText;
  late TextEditingController myController;
  var rando = Random();

  MyStatelessTextField(
      {super.key,
      required Function onTypedText,
      required TextEditingController textController}) {
    this.onTypedText = onTypedText;
    this.myController = textController;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: 500,
        child: TextField(
          controller: myController,
          onChanged: (text) {
            onTypedText(text);
          },
        ),
      ),
      Text(rando.nextInt(100).toString())
    ]);
  }
}

class MyHookWidget extends HookWidget {
  late Function onTypedText;
  MyHookWidget({super.key, required Function onTypedText}) {
    this.onTypedText = onTypedText;
  }

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final controller = useTextEditingController();
    return TextField(
      focusNode: focusNode,
      controller: controller,
      onChanged: (value) {
        onTypedText(value);
      },
    );
  }
}
