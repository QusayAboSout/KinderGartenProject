import 'dart:convert';

import 'package:frontend/core/services/session.dart';
import 'package:frontend/model/custom_excetion.dart';
import 'package:frontend/utils/global.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService();

  String getBaseUrl() {
    if (Global.api.contains("https")) {
      return Global.api.replaceAll("https://", "");
    } else {
      return Global.api.replaceAll("http://", "");
    }
  }

  Future<dynamic> postDynamic(String path, Map<String, dynamic>? data,
      {Map<String, dynamic>? params}) async {
    var url = Uri.https(getBaseUrl(), "/api/$path", params);
    var jsonBody = data != null ? jsonEncode(data) : null;
    var response = await http.post(url, body: jsonBody, headers: headers);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else if (response.statusCode == 555) {
      throw CustomExcetion(response.body);
    }
    throw Exception(response.body);
  }

  Future<Map<String, dynamic>> post(String path, Map<String, dynamic>? data,
      {Map<String, dynamic>? params}) async {
    var result = await postDynamic(path, data, params: params);
    return result;
  }

  Map<String, String> get headers {
    var tokin = Session.token ?? "";
    return <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $tokin'
    };
  }

  Future<dynamic> getDynamic(String path,
      {Map<String, dynamic>? params}) async {
    var url = Uri.https(getBaseUrl(), "/api/$path", params);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else if (response.statusCode == 555) {
      throw CustomExcetion(response.body);
    }
    throw Exception(response.body);
  }

  Future<Map<String, dynamic>> get(String path,
      {Map<String, dynamic>? params}) async {
    var result = await getDynamic(path, params: params);
    return result;
  }

  Future<List<dynamic>> getList(String path,
      {Map<String, dynamic>? params}) async {
    var url = Uri.https(getBaseUrl(), "/api/$path", params);
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else if (response.statusCode == 555) {
      throw CustomExcetion(response.body);
    }
    throw Exception(response.body);
  }

  Future<Map<String, dynamic>> getAllPagination(
      String path, Map<String, dynamic> dto) async {
    Uri url = Uri.https(getBaseUrl(), "/api/$path", dto);

    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else if (response.statusCode == 555) {
      throw CustomExcetion(response.body);
    }
    throw Exception(response.body);
  }

  Future<dynamic> putDynamic(String path, Map<String, dynamic>? data,
      {Map<String, dynamic>? params}) async {
    var url = Uri.https(getBaseUrl(), "/api/$path");
    var jsonBody = jsonEncode(data);
    var response = await http.put(url, body: jsonBody, headers: headers);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else if (response.statusCode == 555) {
      throw CustomExcetion(response.body);
    }
    throw Exception(response.body);
  }

  Future<Map<String, dynamic>> put(String path, Map<String, dynamic>? data,
      {Map<String, dynamic>? params}) async {
    var result = await putDynamic(path, data, params: params);
    return result;
  }

  Future<dynamic> putListDynamic(String path, List<Map<String, dynamic>>? data,
      {Map<String, dynamic>? params}) async {
    var url = Uri.https(getBaseUrl(), "/api/$path", params);
    var jsonBody = data != null ? jsonEncode(data) : null;
    var response = await http.put(url, body: jsonBody, headers: headers);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else if (response.statusCode == 555) {
      throw CustomExcetion(response.body);
    }
    throw Exception(response.body);
  }

  Future<bool> delete(String path) async {
    var url = Uri.https(getBaseUrl(), "/api/$path");
    var response = await http.delete(url, headers: headers);
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return result;
    } else if (response.statusCode == 555) {
      throw CustomExcetion(response.body);
    }
    throw Exception(response.body);
  }
}
