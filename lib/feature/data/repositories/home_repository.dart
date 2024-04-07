import 'package:test_temp/feature/data/base_data_provider.dart';
import 'package:test_temp/feature/data/service/api_service.dart';

class HomeRepository {
  BaseDataProvider dataProvider = ApiService();

  Future<dynamic> fetchProducts() async {
    return await dataProvider.getData();
  }
}
