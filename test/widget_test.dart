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

  SQLService sqlService = SQLService();
  UserRepository repository = UserRepository(sqlService);
  User objUser = User(repository);
  objUser.insertData();

}
// Problem- High level class is dependant on low level class for
// ex: UserRepo is dependant on SQLService. So we have to design abstraction between them.
class UserRepository {
  SQLService sqlService;
  UserRepository(this.sqlService);
}
class SQLService{
  insertData() {
    print("insert Data");
  }
  deleteData() {
    print("delete Data");
  }
}
class User {
  UserRepository repository;
  User(this.repository);
  insertData() {
    repository.sqlService.insertData();
  }
}

