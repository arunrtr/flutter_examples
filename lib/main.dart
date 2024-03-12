
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/item_provider.dart';

import 'screen/todo_list.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => ItemProvider())],
    child: MaterialApp(
      title: 'Flutter',
      theme: ThemeData.dark(),
      home: const ToDoListScreen(),
    ),
  ));
}
