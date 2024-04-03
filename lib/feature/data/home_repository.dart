import 'package:test_temp/feature/data/source/api_service.dart';

class HomeRepository {
  ApiService apiService = ApiService();

  // Future<List<Map<String,dynamic>>> fetchProducts() async {
  //   return await apiService.fetchProducts();
  // }

  Future<List<dynamic>> fetchProductsFromApi() async {
    return await apiService.fetchProductsFromApi();
  }
}