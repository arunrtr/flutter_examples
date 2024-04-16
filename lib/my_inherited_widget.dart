import 'package:flutter/material.dart';

class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget(this.child, this.name) : super(child: child);
  final Widget child;
  final String name;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static MyInheritedWidget? of(BuildContext ctx) {
    return ctx.dependOnInheritedWidgetOfExactType();
  }
}
