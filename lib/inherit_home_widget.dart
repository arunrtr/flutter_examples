import 'package:flutter/material.dart';


class InheritHomeWidget extends InheritedWidget {

  final Widget child;
  final String name;
  final int age;
  const InheritHomeWidget(this.child, this.name, this.age): super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

static InheritHomeWidget? of(BuildContext ctx){
    InheritHomeWidget? widget =  ctx.dependOnInheritedWidgetOfExactType<InheritHomeWidget>();
    return widget;
}
}
