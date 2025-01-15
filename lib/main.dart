import 'package:flutter/material.dart';
import 'package:test_temp/animation/animation_demo.dart';
import 'package:test_temp/examples/isolates_1.dart';
import 'package:test_temp/feature/bloc_state_management/presentation/home_screen1.dart';
import 'package:test_temp/home_screen.dart';
import 'package:test_temp/lifecycle/lifecycle_parent.dart';
import 'package:test_temp/my_inherited_widget.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData.dark(), home: HomeScreen1()));
}
