// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_temp/main.dart';

void main() {
  //SQLService service = SQLService();
  MYSQLService service = MYSQLService();

  UserRepository repository = UserRepository(service);
  User objUser = User(repository);
  objUser.insertData();
}

abstract class DataBaseService {
  insertData();
}
class SQLService extends DataBaseService{
  @override
  insertData() {
      print("Inserting Data");
  }
}

class MYSQLService extends DataBaseService {
  @override
  insertData() {
    print("Inserting MYSQL Data");
  }
}

class UserRepository {
  DataBaseService service;
  UserRepository(this.service);

}
class User {
  UserRepository repository;
  User(this.repository);
  insertData(){
    repository.service.insertData();

  }
}


