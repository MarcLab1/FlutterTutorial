import 'package:flutter/material.dart';

class Dog {
  final String name;

  Dog({required this.name});

  @override
  String toString() {
    return this.name + " says woof";
  }
}

class DogPark {
  //extends ValueNotifier<List<Dog>> {
  //singleton creation in Dart
  DogPark._sharedInstance();
  static final DogPark _shared = DogPark._sharedInstance();

  factory DogPark() => _shared;

  final List<Dog> _dogs = [];
  int get length => _dogs.length;

  void addDog({required Dog dog}) {
    _dogs.add(dog);
  }

  void removeDog({required Dog dog}) {
    _dogs.remove(dog);
  }

  Dog? dog({required int atIndex}) =>
      _dogs.length > atIndex ? _dogs[atIndex] : null;
}

void main() {
  runApp(HomeWidget());
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late final TextEditingController _controller;
  late DogPark dogPark;

  @override
  void initState() {
    _controller = TextEditingController();
    dogPark = DogPark();
    dogPark.addDog(dog: Dog(name: "avery"));
    dogPark.addDog(dog: Dog(name: "willow"));
    dogPark.addDog(dog: Dog(name: "pesto"));
    dogPark.addDog(dog: Dog(name: "tino"));
    dogPark.addDog(dog: Dog(name: "cowie"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Enter a dog'),
                  controller: _controller,
                  onChanged: (text) {
                    _controller.text = text;
                  },
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dogPark.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(dogPark.dog(atIndex: index).toString()));
                    })
              ],
            )));
  }
}
