import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/home/item_provider.dart';
import 'package:test_temp/home/presentation/home_detail.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Consumer<ItemProvider>(
      builder: (ctx, itemProvider, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Demo App1"),),
          body: Column(
            children: [
              Text("Curret Value = ${itemProvider.value}",),
              ElevatedButton(onPressed: (){
               itemProvider.addItem();
              }, child: Text("Increase")),
              ElevatedButton(onPressed: (){
                print("Detail Clicked");
                Navigator.push(context, MaterialPageRoute(builder: (ctx) => const HomeDetail()));
              }, child: Text("Detail"))
            ],
          ),

        );
      },

    );
  }
}
