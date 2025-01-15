// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_temp/main.dart';

void main() async {
  print("Hello world");
  List<int> arr = [5, 4, 3, 2, 3, 6, 1];
  // print("Duplicate Item = ${findDuplicateNum(arr)}");
  print("Pair Sum = ${getPairSum(arr, 7)}");

  Shape obj1 = Shape(Circle(radius: 5));
  obj1.calculateArea();

  List<String> arr1 = List.from(<int>[1,2,3]);
  List<String> arr2 = List.of(<int>[1,2,3]);

}

List<int> findDuplicateNum(List<int> arr) {
  List<int> arrTemp = [];
  for (int i = 0; i <= arr.length - 1; i++) {
    int toVisit = arr[i].abs() - 1;

    if (arr[toVisit] < 0) {
      arrTemp.add(arr[toVisit].abs());
    } else {
      arr[toVisit] = arr[toVisit] * -1;
    }
  }
  return arrTemp;
}

List<int> getPairSum(List<int> arr, int num) {
  //[5,4,3,2,3,6,1] -> 7
  List<int> arrToReturn = [];
  Map<int, int> dict = {};
  for (int i = 0; i <= arr.length - 1; i++) {
    int target = num - arr[i];
    if (dict[target] == null) {
      dict[arr[i]] = 0;
    } else {
      arrToReturn.add(target);
      arrToReturn.add(arr[i]);
    }
  }
  return arrToReturn;
}

//Single, OCP
abstract class AreaCalculator {
  int calculateArea();
}

class Shape {
  AreaCalculator objShape;

  Shape(this.objShape);

  calculateArea() {
    return objShape.calculateArea();
  }
}

class Circle extends AreaCalculator {
  int radius;

  @override
  int calculateArea() {
    return radius * radius;
  }

  Circle({required this.radius});
}

class Rectangle extends AreaCalculator {
  int width;
  int height;

  @override
  int calculateArea() {
    return width * height;
  }

  Rectangle(this.width, this.height);
}

//Liksov- children should be substitute without any issue

class LazySingleton {
  static LazySingleton? _instance;
  LazySingleton._(){
    _instance = this;
  }
  factory LazySingleton() => _instance ?? LazySingleton._();
}

class EagerSingleton {
  static final EagerSingleton instance = EagerSingleton._();
  EagerSingleton._();
  factory EagerSingleton() => instance;
}