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
  PetrolIml obj = PetrolIml();
  GasImpl obj1 = GasImpl();
}

// If class Car has all the functionalities then subclass has to behave same way as parent. But it will
// give unneccessary exposure of methods.

class Car {
  drive() {
    print("Drive");
  }

  applyBrake() {
    print("Applying Brake");
  }
}

class Petrol {
  fillPetrol() {
    print("Petrol Impl");
  }
}

abstract class PetrolCar implements Car, Petrol {}

class PetrolIml extends PetrolCar {
  @override
  applyBrake() {
    // TODO: implement applyBrake
    throw UnimplementedError();
  }

  @override
  drive() {
    // TODO: implement drive
    throw UnimplementedError();
  }

  @override
  fillPetrol() {
    // TODO: implement fillPetrol
    throw UnimplementedError();
  }
}

//Same way for class Gas
class Gas {
  fillGas() {
    print("Fill Gas");
  }
}

abstract class GasCar implements Gas, Car {}

class GasImpl extends GasCar {
  @override
  applyBrake() {
    // TODO: implement applyBrake
    throw UnimplementedError();
  }

  @override
  drive() {
    // TODO: implement drive
    throw UnimplementedError();
  }

  @override
  fillGas() {
    // TODO: implement fillGas
    throw UnimplementedError();
  }
}
