import 'package:test_temp/home/data/ApiService.dart';

class HomeRepository {
  ApiService apiService = ApiService();

  Future<List<dynamic>> fetchProduct() async {
    return apiService.fetchProducts();
  }
}
