import 'package:flutter/material.dart';

class ItemProvider extends ChangeNotifier {
   int value = 0;
  addItem(){
    value += 1;
    notifyListeners();
  }


}