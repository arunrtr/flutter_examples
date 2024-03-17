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
Person objPerson = Person();
objPerson.setFirstName("Arun");
objPerson.setLastName("kumar");
print(objPerson.fullName);
}


class Person {
  late String _firstName;
  late String _lastName;

  setFirstName(String s){
    _firstName = s;
  }
  setLastName(String s){
    _lastName = s;
  }
  String get fullName => _firstName+_lastName;


}
