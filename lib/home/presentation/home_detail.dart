import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/home/item_provider.dart';
class HomeDetail extends StatefulWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (ctx,itemProvider,child) {
        return  Scaffold(
          appBar: AppBar(title: Text("Details"),),
          body: Column(
            children: [
              Text("Current value = ${itemProvider.value}",),
              ElevatedButton(onPressed: (){
                itemProvider.addItem();
              }, child: Text("Increase")),
            ],
          ),
        );
      },
    );
  }
}
