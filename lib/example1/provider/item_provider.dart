import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
  List items = [];
  addItem(List data) {
    print("Before Notifiying ${items}");
    items = data;
    notifyListeners();
    print("After Notifiying ${items}");

  }
}