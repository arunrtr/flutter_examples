import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {

  double marginTop = 220.0;
  double heightTemp = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Demo"),
      ),
      body: GestureDetector(
        onTap: () {
          setState((){
            marginTop = 20;
            heightTemp = 0;

          });
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 3),
          margin: EdgeInsets.only(top: marginTop),
          width: 100,
          height: heightTemp,
          color: Colors.red,
        ),
      ),
    );
  }
}
