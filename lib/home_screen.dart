import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final childState = GlobalKey<_CounterWidgetState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Global Key"),),
      body: Center(child: CounterWidget(key: childState,)),
      floatingActionButton: FloatingActionButton(onPressed: (){
        childState.currentState!._onIncrement();
        print("Value is ${childState.currentState!._value}");
      },
      child: Text("Click me"),),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _value  = 0;
  @override
  Widget build(BuildContext context) {
    return Text("Counter : ${_value}");
  }
  _onIncrement() {
    _value += 1;
    setState((){});
  }
}

