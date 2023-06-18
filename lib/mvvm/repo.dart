import 'package:http/http.dart';
import 'package:my_app/mvvm/api.dart';

class Repo {
  late ApiGetter apiGetter;

  Repo(ApiGetter apiGetter) {
    this.apiGetter = apiGetter;
  }
  Future<Response> getResponse() async {
    return apiGetter.getResponse();
  }
}
