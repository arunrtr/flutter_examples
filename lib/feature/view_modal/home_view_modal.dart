import 'package:flutter/cupertino.dart';
import 'package:test_temp/feature/data/repositories/home_repository.dart';

class HomeViewModal extends ChangeNotifier {
  List<dynamic>? products;
  HomeRepository repository = HomeRepository();

  _setProducts(List<dynamic> data) {
    products = data;
    notifyListeners();
  }

  Future<dynamic> fetchProducts() async {
    final response = await repository.fetchProducts();
    _setProducts(response);
  }
}
