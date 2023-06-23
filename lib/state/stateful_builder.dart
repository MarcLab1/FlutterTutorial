import 'package:flutter/material.dart';

void main() {
  runApp(FancyWidget());
}

class FancyWidget extends StatelessWidget {
  int counter = 0;

  FancyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StatefulBuilder(
            builder: (context, StateSetter setState) => Scaffold(
                  body: Center(
                    child: Text(counter.toString(),
                        textDirection: TextDirection.ltr),
                  ),
                  floatingActionButton: FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                  ),
                )));
  }
}
