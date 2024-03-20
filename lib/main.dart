import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/data_provider.dart';
import 'package:test_temp/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (BuildContext context) => DataProvider(),
      )
    ],
    child: MaterialApp(
      title: 'Flutter',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    ),
  ));
}
