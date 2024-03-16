// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_temp/main.dart';

void main() async{

  final result = getFullName().asyncExpand((name) => getCharacters(name));
  await for(final str in result){
    print(str);
  }
}

Stream<String> getCharacters(String name) async* {
    for(int i = 0; i<name.length; i++){
       await Future.delayed(const Duration(seconds: 1));
       yield name[i];
    }
}

Stream<String> getFullName() async* {
  await Future.delayed(const Duration(seconds: 3));
  yield "Arun";

  await Future.delayed(const Duration(seconds: 3));
  yield "Kumar";

}