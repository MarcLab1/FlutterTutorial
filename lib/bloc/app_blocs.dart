import 'package:flutter_bloc/flutter_bloc.dart';

import '../flutter_and_bloc/QuoteRepository.dart';
import '../flutter_and_bloc/quote.dart';
import 'app_events.dart';
import 'app_states.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  final QuoteRepository _quoteRepository;
  List<Quote> quotes = List.empty();

  QuoteBloc(this._quoteRepository) : super(QuoteLoadingState()) {
    on<LoadQuoteEvent>((event, emit) async {
      emit(QuoteLoadingState());
      try {
        quotes = await _quoteRepository.getQuotes();
        emit(QuoteLoadedState(quotes));
      } catch (e) {
        emit(QuoteErrorState(e.toString()));
      }
    });
  }

  Stream<QuoteState> mapEventToState(QuoteEvent event) async* {
    if (event is AddQuoteEvent) {
      // If fetchSomething() takes a while, it will block the
      // internal event queue, preventing other events from firing.
      final moreQuotes = await _quoteRepository.getQuotes();

      yield QuoteLoadedStateTwo(moreQuotes);
    }
  }
}
