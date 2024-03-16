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
  Shape objCircle = Shape.of(Circle(radius: 2.0));
  Shape objRectangle = Shape.of(Rectangle(length: 5));
  objCircle.calculateArea();
  objRectangle.calculateArea();
}

abstract class AreaCalculator {
  late num param;

  calculateArea();
}

class Shape {
  AreaCalculator? type;

  Shape.of(this.type);

  calculateArea() {
    print("Area of = ${type?.runtimeType} is ${type?.calculateArea()}");
  }
}

class Circle extends AreaCalculator {
  Circle({required double radius}) {
    param = radius;
  }

  @override
  num calculateArea() {
    return 3.14 * param * param;
  }
}

class Rectangle extends AreaCalculator {
  Rectangle({required int length}) {
    param = length;
  }

  @override
  calculateArea() {
    return param * param;
  }
}

// here is the issue as its keeps on modifying the esxisting class
class AreaCalculatorOrg {
  String? type;
  num? param;
  num calculateArea() {
    if(type == "circle") {
      return 3.14*param!*param!;
    }else if (type == "rectangle") {
      return param! * param!;
    }
    
    return 0.0;
  }

}