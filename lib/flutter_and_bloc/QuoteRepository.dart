import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:my_app/flutter_and_bloc/quote.dart';
import 'package:my_app/flutter_and_bloc/quote_example.dart';

class QuoteRepository {
  late var dio;
  late var client;

  QuoteRepository() {
    dio = Dio();
    dio.options.headers["Demo-Header"] =
        "demo header"; // config your dio headers globally
    client = RestClient(dio);
  }

  Future<Quote> getQuote() async {
    try {
      return await client.getQuote();
    } on DioException catch (_) {
      throw Exception();
    }
  }

  Future<List<Quote>> getQuotes() async {
    try {
      return await client.getQuotes();
    } on DioException catch (_) {
      throw Exception();
    }
  }

  Future<List<Quote>> getQuotesWithLimit(String limit) async {
    try {
      return await client.getQuotesWithLimit(limit);
    } on DioException catch (_) {
      throw Exception();
    }
  }
}
