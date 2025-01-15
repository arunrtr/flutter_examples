import 'package:dio/dio.dart';
import 'package:test_temp/feature/bloc_state_management/data/data_source/base_data_source_provider.dart';

class ApiService extends BaseDataSourceProvider {

  final Dio _dio = Dio();

  @override
  Future<dynamic> fetchProducts() async {
    final response = await _dio.get("https://dummyjson.com/products");
    final result = response.data;
    return result["products"];
  }


}