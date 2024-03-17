import 'package:dio/dio.dart';

class ApiService {
  Dio dio = Dio();

  Future<List<dynamic>> fetchProducts() async {
    final response = await dio.get("https://dummyjson.com/products");
    final result = response.data;
    return result["products"];
  }
}
