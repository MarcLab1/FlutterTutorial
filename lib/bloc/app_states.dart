import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../flutter_and_bloc/quote.dart';

@immutable
abstract class QuoteState extends Equatable {}

class QuoteLoadingState extends QuoteState {
  @override
  List<Object?> get props => [];
}

class QuoteLoadedState extends QuoteState {
  final List<Quote> quotes;
  QuoteLoadedState(this.quotes);
  @override
  List<Object?> get props => [quotes];
}

class QuoteLoadedStateTwo extends QuoteState {
  final List<Quote> quotes;
  QuoteLoadedStateTwo(this.quotes);
  @override
  List<Object?> get props => [quotes];
}

class QuoteErrorState extends QuoteState {
  final String error;
  QuoteErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
