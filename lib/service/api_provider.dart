import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  Future<http.Response> getTodoList() {
    Uri uri = Uri.parse("https://api.nstack.in/v1/todos");
    final response = http.get(uri, headers: {"content-type": "application/json"});
    return response;
  }

  Future<http.Response> saveTask(Map data) async {
    String strUrl = "https://api.nstack.in/v1/todos";
    Uri uri = Uri.parse(strUrl);
    final response = await http.post(uri, headers: {"content-type": "application/json"}, body: jsonEncode(data));
    return response;
  }
}
