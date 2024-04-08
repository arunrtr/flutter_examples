import 'package:flutter/material.dart';
import 'package:test_temp/color_widget.dart';

class HomeScreen extends StatefulWidget {
  List<Widget> arrChildren = [];
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.arrChildren = [
      Padding(
        key: ValueKey(1),
        padding: const EdgeInsets.all(8.0),
        child: ColorWidget( num: 1,),
      ),
      Padding(
        key: ValueKey(2),
        padding: const EdgeInsets.all(8.0),
        child: ColorWidget( num: 2,),
      )
    ];

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            final child = widget.arrChildren.removeAt(0);
            widget.arrChildren.insert(1, child);
            setState((){});
          },
          child: Icon(Icons.swap_horiz, size: 20,),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.arrChildren
          ),
        )
    );
  }
}
