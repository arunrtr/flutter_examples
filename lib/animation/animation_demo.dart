import 'package:flutter/material.dart';

class AnimationDemo extends StatefulWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  State<AnimationDemo> createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _colorAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(duration: Duration(milliseconds: 2000), vsync: this);

    _colorAnimation = ColorTween(begin: Colors.grey, end: Colors.red).animate(_animationController);
    _animationController.addListener(() {
      //print(_animationController.value);
      print(_colorAnimation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Animation Demo"),
        ),
        body: AnimatedBuilder(
          animation: _animationController,
          builder: (ctx, widget) {
            return Center(
                child: IconButton(
              onPressed: () {
                _animationController.forward();

              },
              icon: const Icon(Icons.favorite),
              color: _colorAnimation.value,
              iconSize: 50,
            ));
          },
        ));
  }
}
