import 'dart:convert';

import 'package:dio/dio.dart';

import '../modal/todo_response.dart';

class ApiProvider {
  Dio dio = Dio();
  Options dioOptions = Options(headers: {"content-type": "application/json"});

  Future<ToDoResponse> getTodoList() async {
    String strUrl = "https://api.nstack.in/v1/todos";
    final response = await dio.get(strUrl);
    final result = ToDoResponse.fromJson(response.data);
    return result;
  }

  Future<Response> saveTask(Map data) async {
    String strUrl = "https://api.nstack.in/v1/todos";
    final response = await dio.post(strUrl, options: dioOptions, data: jsonEncode(data));
    return response;
  }
}
