import 'dart:isolate';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10,),
          Center(child: ElevatedButton(
            child: Text("Download Data"),
            onPressed: () => useIsolates(),)),
        ],
      ),
    );
  }
}

useWithoutIsolates() {
  int value =0;
  for(int i= 0; i< 4000000000; i++){
    value += i;
  }
  print(value);

}

useIsolates() async {
  final ReceivePort rp = ReceivePort();
  // without try catch
  await Isolate.spawn(heavyTask, [rp.sendPort, 4000000000]);
  final response = await rp.first;
  print(response);

  // try catch example
  // try {
  //   await Isolate.spawn(heavyTask, [rp.sendPort, 4000000000]);
  //
  // } on Object {
  //     debugPrint("Isolated Failed");
  //     rp.close();
  // }
  //
  // final response = await rp.first;
  // print(response);

}

heavyTask(List<dynamic> args){
  SendPort sendPort = args[0];
  int limit = args[1];
  int value =0;
  for(int i= 0; i< limit; i++){
    value += i;
  }
  // We can use either send or isolates exit, at receving side it should be first index
  sendPort.send(value);
  //Isolate.exit(sendPort,value);
}

