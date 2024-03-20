import 'package:flutter/material.dart';
import 'package:test_temp/data_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int? value = DataProvider.of(context)?.value;
    print("Value is $value");
    return Scaffold(
      appBar: AppBar(title: Text("Inherited Widget Demo"),),
      body: Text(""),
    );
  }
}
