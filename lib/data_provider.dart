import 'package:flutter/material.dart';

class DataProvider extends InheritedWidget {
  final Widget child;
  final int value;
  DataProvider({required this.child, required this.value}) : super(child: child);

  static DataProvider? of (BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<DataProvider>();
  }
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }


}
