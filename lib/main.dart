import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_temp/home/presentation/bloc/home_bloc.dart';
import 'package:test_temp/home/presentation/home_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    theme: ThemeData.dark(),
    home: const HomeScreen(),
  ));
}
