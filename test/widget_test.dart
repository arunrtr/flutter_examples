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
  final LazyLogger singleton = LazyLogger();
  print(singleton.name);
  final EagerLogger singleton1 = EagerLogger();
  print(singleton1.name);

}

class LazyLogger {
  static LazyLogger? _instance;
  factory LazyLogger() {
   return _instance ?? LazyLogger._();
  }
  LazyLogger._(){
   _instance = this;
  }
  String get name => "arun";
}

class EagerLogger {
  static final EagerLogger _instance = EagerLogger._();
  EagerLogger._();
  factory EagerLogger () => _instance;

  String get name => "varun";
}
