import 'dart:isolate';

import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool shouldDisplayIndicator = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("init");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text("Isolates"),),
      body: Center(
        child: Column(
          children: [
            shouldDisplayIndicator ? CircularProgressIndicator() : SizedBox(),
            ElevatedButton(onPressed: () {
              fetchDataWithIsolates().then((value) {
                if(value != null) {
                  print("Isolate Value is = $value");
                  setState((){
                    shouldDisplayIndicator = false;

                  });

                }
              });
            }, child: Text("Fetch Data"))

          ],
        ),
      ),
    );
  }

}

fetchData(){
  int result = 0;
  for (int i = 0 ; i <5000000000; i++){
    result +=1;
  }
  print("Value is  $result");
}
Future <dynamic> fetchDataWithIsolates() async {
  print("Clicked");
  ReceivePort rp = ReceivePort();
  await Isolate.spawn(performLongTask, [rp.sendPort]);
  final response = await rp.first;
  return response;
}

performLongTask(dynamic args) {
  SendPort sp = args[0];
  int result = 0;
  for (int i = 0 ; i <5000000000; i++){
    result +=1;
  }
  sp.send(result);

}