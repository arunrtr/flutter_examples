import 'dart:isolate';

import 'package:flutter/material.dart';
class IsolatesExample1 extends StatefulWidget {
  const IsolatesExample1({Key? key}) : super(key: key);

  @override
  State<IsolatesExample1> createState() => _IsolatesExample1State();
}

class _IsolatesExample1State extends State<IsolatesExample1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Isolates5"),),
      body: Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              runWithIsolate();
            }, child: Text("Press Me"))
          ],
        ),
      ),
    );
  }
}

runWithIsolate() async {
  ReceivePort rp = ReceivePort();
  await Isolate.spawn(longTask, [rp.sendPort]);
  final result = await rp.first;
  print("Final $result");
}

longTask(dynamic args){

  SendPort sp = args[0];
  print("Enter");
  int count = 0;
  for(int i =0 ; i< 5000000000; i++) {
    count += 1;
  }
  print("Result = $count");
  print("Exit");
  Isolate.exit(sp, count);

}