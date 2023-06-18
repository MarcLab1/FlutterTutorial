import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class QuoteEvent {
  const QuoteEvent();
}

class LoadQuoteEvent extends QuoteEvent {
  @override
  List<Object?> get props => [];
}

class AddQuoteEvent extends QuoteEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
