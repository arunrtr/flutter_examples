import 'package:flutter/material.dart';

class DataProvider extends ChangeNotifier {
  int counter = 0;

  updateCounter() {
    counter += 1;
    notifyListeners();
  }

}
