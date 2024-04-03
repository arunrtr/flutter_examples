import 'package:flutter/material.dart';
import 'package:test_temp/feature/data/home_repository.dart';

class HomeViewModal extends ChangeNotifier {

  final HomeRepository _repository = HomeRepository();
  List<dynamic> arrData = [];

  setProducts(List<dynamic> data) {
    arrData = data;
    notifyListeners();
  }

    fetchProducts() async {
    final result = await _repository.fetchProductsFromApi();
    setProducts(result);
}
}