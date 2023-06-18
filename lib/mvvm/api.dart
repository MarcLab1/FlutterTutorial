import 'dart:convert';
import 'package:http/http.dart';

class ApiGetter {
  Future<Response> getResponse() async {
    Response response =
        await get(Uri.https("jsonplaceholder.typicode.com", "todos/1"));
    return response;
    //return jsonDecode(response.statusCode);
  }
}
