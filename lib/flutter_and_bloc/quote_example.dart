import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/flutter_and_bloc/quote.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'quote_example.g.dart';

@RestApi(baseUrl: "https://api.quotable.io/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/random")
  Future<Quote> getQuote();

  @GET("/quotes/random")
  Future<List<Quote>> getQuotes();

  @GET("/quotes/random?limit={limit}")
  Future<List<Quote>> getQuotesWithLimit(@Path("limit") String limit);
}
