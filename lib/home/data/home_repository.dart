import 'package:test_temp/home/data/api_service.dart';

class HomeRepository {
  ApiService apiService = ApiService();

  Future<List<dynamic>> fetchProduct() async {
    return apiService.fetchProducts();
  }
}
