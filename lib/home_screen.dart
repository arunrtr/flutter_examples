import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/data_provider.dart';
import 'package:test_temp/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo"),
      ),
      body: Consumer<DataProvider>(builder: (ctx, provider, child) {
        return Column(
          children: [
            Text("Value is ${provider.counter}"),
            ElevatedButton(
              onPressed: () {
                provider.updateCounter();
              },
              child: Text("Increase"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DetailScreen()));
              },
              child: Text("Details"),
            ),
          ],
        );
      }),
    );
  }
}
