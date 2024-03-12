import 'dart:convert';

import 'package:rxdart/rxdart.dart';

import '../repositories/todo_list_repository.dart';


class ToDoListBloc {
  final BehaviorSubject<dynamic> _subject = BehaviorSubject<dynamic>();
  final ToDoListRepository repository = ToDoListRepository();

  BehaviorSubject<dynamic> get subject => _subject;

  getList() async {
    final result = await repository.getToDoList();
    _subject.sink.add(result);
  }
}

final blocToDoList = ToDoListBloc();
