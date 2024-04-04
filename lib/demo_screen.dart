import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  DemoScreen({Key? key}) : super(key: key);
  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Demo1")),
      body: ValueListenableBuilder(
          valueListenable: _counter,
          builder: (BuildContext context, int value, Widget? child) {
            return Center(child: Text("${_counter.value}"));
          },),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value += 1;
          print("Counter = ${ _counter.value}");
        },
        child: Text("+"),
      ),
    );
  }
}
