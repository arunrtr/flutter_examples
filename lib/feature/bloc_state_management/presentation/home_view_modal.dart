import 'package:flutter/material.dart';
import 'package:test_temp/feature/bloc_state_management/data/repository/home_repository.dart';

class HomeViewModal extends ChangeNotifier {
  HomeRepository homeRepository = HomeRepository();

   List<dynamic>? products;

  setAndUpdateProducts(dynamic data) {
    products = data;
    notifyListeners();
  }

  getProduct() async {
    final products = await homeRepository.getProductsList();
    setAndUpdateProducts(products);
  }
}
