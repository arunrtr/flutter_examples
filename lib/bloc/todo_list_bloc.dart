import 'dart:convert';

import 'package:http/http.dart';
import 'package:test_temp/repositories/todo_list_repository.dart';
import 'package:rxdart/rxdart.dart';

class ToDoListBloc {
  final BehaviorSubject<dynamic> _subject = BehaviorSubject<dynamic>();
  final ToDoListRepository repository = ToDoListRepository();

  BehaviorSubject<dynamic> get subject => _subject;

  getList() async {
    final result = await repository.getToDoList();
    if (result is Response) {
      final data = jsonDecode(result.body);
      _subject.sink.add(data);
    } else {
      _subject.sink.add("");
    }
  }
}

final blocToDoList = ToDoListBloc();
