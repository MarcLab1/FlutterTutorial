import 'package:flutter/material.dart';
import 'package:my_app/classes.dart';

void main() {
  runApp(HomeWidget());
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  bool clicked = false;
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              child: Text(
                "click me?",
                style: TextStyle(fontSize: 33),
              ),
              onTap: () {
                setState(() {
                  clicked = !clicked;
                });
              },
            ),
            Text('the text was clicked? $clicked'),
            Padding(
              padding: const EdgeInsets.only(top: 22.0),
              child: GestureDetector(
                child: Text(
                  "textbox enabled = " + enabled.toString(),
                ),
                onTap: () {
                  setState(() {
                    enabled = !enabled;
                  });
                },
              ),
            ),
            TextField(
              enabled: enabled,
            )
          ],
        ),
      ),
    );
  }
}
