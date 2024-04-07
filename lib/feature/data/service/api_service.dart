import 'package:test_temp/feature/data/base_data_provider.dart';
import 'package:dio/dio.dart';

class ApiService extends BaseDataProvider {
  Dio _dio = Dio();

  @override
  Future<dynamic> getData() async {
    final response = await _dio.get("https://dummyjson.com/products");
    final result = response.data;
    return result["products"];
  }
}
