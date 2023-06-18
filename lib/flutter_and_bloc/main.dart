import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/flutter_and_bloc/quote.dart';

import 'QuoteRepository.dart';

void main() => runApp(App());

class QuoteState {
  List<Quote> quotes = List.empty();
  QuoteState({required List<Quote> qu}) {
    this.quotes = qu;
  }
}

class ErrorState extends QuoteState {
  String error = "";
  ErrorState({required String error}) : super(qu: List.empty()) {
    this.error = error;
  }
}

class InitialState extends QuoteState {
  InitialState() : super(qu: List.empty());
}

abstract class QuoteEvent {}

class GetQuote extends QuoteEvent {}

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(QuoteRepository quoteRepository) : super(InitialState()) {
    final QuoteRepository _quoteRepository = QuoteRepository();

    on<GetQuote>((event, emit) async {
      try {
        var quotes = await _quoteRepository.getQuotesWithLimit("1");
        emit(QuoteState(qu: quotes));
      } catch (e) {
        emit(ErrorState(error: "Something went wrong"));
      }
    });
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => QuoteBloc(QuoteRepository()),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  var quotes = <Quote>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Random().nextInt(20).toString())),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextButton(
                onPressed: () {
                  context.read<QuoteBloc>().add(GetQuote());
                },
                child: const Text("click to get a quote 545",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        backgroundColor: Colors.greenAccent)),
              ),
            ),
            BlocBuilder<QuoteBloc, QuoteState>(builder: (context, state) {
              quotes.addAll(state.quotes);

              if (state is ErrorState) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(state.error.toString()),
                );
              } else {
                return ListView.builder(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: quotes.length,
                  prototypeItem: const ListTile(
                    title: Text("alo"),
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${index + 1} : ${quotes[index].content.toString()}"),
                          Text(quotes[index].author.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 23)),
                        ],
                      ),
                    );
                  },
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}

//type st and use shortcuts in VSCode

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(counter.toString()),
        IconButton(
            onPressed: () {
              setState(() {
                counter++;
              });
            },
            icon: Icon(Icons.abc))
      ],
    ));
  }
}
