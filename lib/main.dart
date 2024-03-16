import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    theme: ThemeData.dark(),
    home: const TestScreen(),
  ));
}

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
