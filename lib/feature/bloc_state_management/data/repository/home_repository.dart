import 'package:test_temp/feature/bloc_state_management/data/data_source/api_service.dart';
import 'package:test_temp/feature/bloc_state_management/data/data_source/base_data_source_provider.dart';

class HomeRepository {
  BaseDataSourceProvider dataSourceProvider = ApiService();

  Future<dynamic> getProductsList() async {
    return await dataSourceProvider.fetchProducts();
  }
}
