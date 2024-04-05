import 'package:dio/dio.dart';
import 'package:test_temp/feature/data/services/base_service_provider.dart';

class ApiService extends BaseServiceProvider {

  Dio _dio = Dio();
  @override
  Future<List<dynamic>> getData() async{
    final response = await _dio.get("https://dummyjson.com/products");
    final result = response.data;
    return result["products"];
  }
}