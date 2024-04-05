import 'package:flutter/material.dart';
import 'package:test_temp/inherit_home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    String name = InheritHomeWidget.of(context)?.name ?? "";
    return Scaffold(
      appBar: AppBar(title: Text("Inherited Widget"),),
      body: Center(
        child: Column(
          children: [
            Text("Name is $name"),
            Text('Age')
          ],
        ),
      ),
    );
  }
}
