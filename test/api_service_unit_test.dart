import 'package:flutter_test/flutter_test.dart';
import 'package:test_temp/home/data/api_service.dart';
import 'package:test_temp/home/data/home_repository.dart';

void main() {
  late ApiService apiService;
  late HomeRepository repository;
  setUp(() {
    apiService = ApiService();
    repository = HomeRepository();
  });
  group("It should return products successfully", () {
    test("Fetch Result should give List dynamic data type", () async {
      final result = await apiService.fetchProducts();
      expect(result.runtimeType, List<dynamic>);
    });

    test("It should return correct data type", () async{
     final result = await repository.fetchProduct();
     expectSync(result.runtimeType, List<dynamic>);
    });
  });
}
