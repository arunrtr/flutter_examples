import 'package:flutter/material.dart';
import 'package:test_temp/home_screen.dart';
import 'package:test_temp/inherit_home_widget.dart';

void main() {
  runApp(InheritHomeWidget(MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen()),
      "Arun",
      25));
}
