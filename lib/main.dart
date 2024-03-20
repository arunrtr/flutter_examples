import 'package:flutter/material.dart';
import 'package:test_temp/data_provider.dart';
import 'package:test_temp/home_screen.dart';

// if we dont wrap widget in Dataprovider it will not pass value down to children
void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    theme: ThemeData.dark(),
    home: const HomeScreen(),
  ));
}

//As we are wrapping Dataprovider it will have value down to children.
// void main() {
//   runApp(DataProvider(
//     value: 5,
//     child: MaterialApp(
//       title: 'Flutter',
//       theme: ThemeData.dark(),
//       home: const HomeScreen(),
//     ),
//   ));
// }