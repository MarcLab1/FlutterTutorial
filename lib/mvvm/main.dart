import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_app/mvvm/api.dart';
import 'package:my_app/mvvm/repo.dart';
import 'dart:developer';

import 'package:my_app/mvvm/viewmodel.dart';

main(List<String> args) async {
  HomeViewModel vm = HomeViewModel();
  print(await vm.getUserId());
}
