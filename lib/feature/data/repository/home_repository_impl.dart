import 'package:test_temp/feature/data/services/api_service.dart';
import 'package:test_temp/feature/data/services/base_service_provider.dart';

class HomeRepositoryImpl {

  BaseServiceProvider baseServiceProvider = ApiService();

  Future<List<dynamic>> getProducts() async{
     return await baseServiceProvider.getData();
  }
}