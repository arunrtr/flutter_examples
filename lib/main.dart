import 'package:flutter/material.dart';
import 'package:test_temp/home_screen.dart';
import 'package:test_temp/lifecycle/lifecycle_parent.dart';
import 'package:test_temp/my_inherited_widget.dart';

void main() {
  runApp(MyInheritedWidget(
      MaterialApp(theme: ThemeData.dark(), home: LifeCycleParent()),
  "Hit h"));
}
