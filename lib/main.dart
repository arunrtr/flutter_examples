
import 'package:flutter/material.dart';
import 'package:test_temp/item_provider.dart';

import 'screen/todo_list.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    theme: ThemeData.dark(),
    home: const ToDoListScreen(),
  ));
}
