import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/data_provider.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Consumer<DataProvider>(
        builder: (ctx,provider,child) {
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
                  Navigator.of(context).pop();
                },
                child: Text("Details"),
              ),
            ],
          );
        },

      ),
    );
  }
}
