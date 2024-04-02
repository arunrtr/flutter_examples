
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/home/item_provider.dart';
import 'package:test_temp/home/presentation/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (ctx)=>ItemProvider())],
    child: MaterialApp(
        theme: ThemeData.dark(),
         home : const HomeScreen()),
  ),
  );
}

