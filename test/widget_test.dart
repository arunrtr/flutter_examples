// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_temp/main.dart';

void main() async {
  print("Hello world");
  List<String> arrBands = ["Metallica", "Foo Fighters", "Pink Floyd", "Nirvana"];

   await for (String name in getNames()) {
    print("$name \n");
  }

  List<int> arr = List.filled(5, 1);
   print(arr);

  List<int> l = [1, 2, 3, 4];
  List<int> r = [3, 4];

  l.removeWhere((element) => r.contains(element));
 print("Value is $l");

}

Stream<String> getNames() async* {

  await Future.delayed(const Duration(seconds: 1));
  yield "Arun";
  await Future.delayed(const Duration(seconds: 3));
  yield "Varun";

}



