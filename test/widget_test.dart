// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_temp/main.dart';

void main() async {
  await for(String value in getMessage().take(10)) {
    print("$value");
  }
}
Stream<String> getMessage() {
  ReceivePort rp = ReceivePort();
  return Isolate.spawn(_getMessage, rp.sendPort)
      .asStream()
      .asyncExpand((_) => rp)
      .takeWhile((element) => element is String)
      .cast();
}

_getMessage(SendPort sp) async {
  await for (final value in Stream.periodic(const Duration(seconds: 1), (_) => "2")) {
    sp.send(value);
  }
}

