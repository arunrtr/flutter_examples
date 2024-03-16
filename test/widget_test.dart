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
  Animal objAnimal = Animal();
  objAnimal.walk();

  Human objHuman = Human();
  objHuman.walk();
  objHuman.sing();
  objHuman.run();
}

mixin CanWalk on CanRun {
  walk() {
    print("CanWalk");
  }

  @override
  run() {
    print("Can Walk: Running");
  }
}
mixin CanRun {
  run() {
    print("Can Run: Running");
  }
}
mixin CanSing {
  sing() {
    print("Can Sing");
  }
}

//Note: if two same methods are defined on mixin then last confirmed mixin will be picked.
class Human with  CanSing, CanRun,CanWalk {}

// NOte: if we are applying/confirmimg mixin on mixin, then with class we have to use both
// mixins and specific order for example below will not work if we use class Animal with CanWalk, CanRun {}
class Animal with  CanRun, CanWalk {}
