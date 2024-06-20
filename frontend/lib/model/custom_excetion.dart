import 'dart:convert';
import 'package:frontend/model/api_excetion.dart';

class CustomExcetion implements Exception {
  late ApiExcetion apiExcetion;
  CustomExcetion(String error) {
    var exceptionMessage = error.toString().replaceFirst("Exception: ", "");
    print(exceptionMessage);
    Map<String, dynamic> exc = jsonDecode(exceptionMessage);
    apiExcetion = ApiExcetion.fromJson(exc);
  }
}
