// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_temp/main.dart';

void main() {
  final double resultDouble = add(5.0, 6.0);
  final int resultInt = add(5, 6);
  final double resultMix = add(5.0, 6);
  print(resultDouble);
  print(resultInt);
  print(resultMix);

}

T add <T extends num > (T lhs, T rhs) {
  return (lhs + rhs) as T ;
}