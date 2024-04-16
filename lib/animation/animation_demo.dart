import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  double marginTop = 220.0;
  double heightTemp = 100.0;
  late ColorTween _tween;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tween = ColorTween(begin: Colors.red, end: Colors.amber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animation Demo"),
        ),
        body: Center(
          child: TweenAnimationBuilder(
              // tween: _tween
              tween: Tween<double>(begin: 1.0, end: 0.0),
              duration: Duration(seconds: 4),
              builder: (ctx, value, widget) {
                return Opacity(
                  opacity: (value as double),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                );
              }),
        ));
  }
}
