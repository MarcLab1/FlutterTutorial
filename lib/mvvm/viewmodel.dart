import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_app/mvvm/api.dart';
import 'package:my_app/mvvm/repo.dart';

class HomeViewModel with ChangeNotifier {
  late ApiGetter apiGetter;
  late Repo repo;
  late int userId = 100;

  HomeViewModel() {
    apiGetter = ApiGetter();
    repo = Repo(apiGetter);
  }

  Future<String> getUserId() async {
    var result = await repo.getResponse();
    var statusCode = jsonDecode(result.statusCode.toString());
    if (statusCode == 200) {
      userId = jsonDecode(result.body)['userId'];
      return "user id = " + jsonDecode(result.body)['userId'].toString();
    } else {
      userId = -1;
      return "could not get userId error of some sort";
    }
  }

  void buttonPress() {
    userId++;
    notifyListeners();
  }
}
