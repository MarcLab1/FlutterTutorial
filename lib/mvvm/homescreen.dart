import 'package:flutter/material.dart';
import 'package:my_app/mvvm/viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(),
        ),
      ],
      child: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  String userId = "";
  late HomeViewModel vm; //= HomeViewModel();

  @override
  void initState() {
    //HomeViewModel vm2 = context.watch<HomeViewModel>();
    vm = Provider.of<HomeViewModel>(context, listen: false);
  }

//just a helper methods we're not using atm
  Future<void> getUserId() async {
    String id = await vm.getUserId();
    setState(() {
      userId = id;
    });
  }

  void buttonPress() {
    vm.buttonPress();
  }

  @override
  Widget build(BuildContext context) {
    //HomeViewModel vm2 = context.watch<HomeViewModel>();

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'My App is the best?',
                textDirection: TextDirection.ltr,
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      vm.buttonPress();
                    },
                    icon: Icon(Icons.add)),
                Text("vm.userId=" + vm.userId.toString()),
                ListenableBuilder(
                  listenable: vm,
                  builder: (BuildContext context, Widget? child) {
                    return Text("ListenableBuilder= ${vm.userId}");
                  },
                ),
                ChangeNotifierProvider<HomeViewModel>(
                    create: (BuildContext context) => vm,
                    child: Consumer<HomeViewModel>(
                        builder: (context, viewModel, _) {
                      return Text(
                          "ChangeNotifierProvider=" + vm.userId.toString());
                    })),
              ],
            )));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
