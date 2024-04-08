import 'dart:math';

import 'package:flutter/material.dart';

class ColorWidget extends StatefulWidget {
  final int num;

  ColorWidget({Key? key,  required this.num}) : super(key: key);

  @override
  State<ColorWidget> createState() => _ColorWidgetState();
}

class _ColorWidgetState extends State<ColorWidget> {

  late Color contColor;
  @override
  void initState() {
    super.initState();
    contColor = Color.fromARGB(255, Random().nextInt(255),
        Random().nextInt(255), Random().nextInt(255));


  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: contColor,
      child: Center(child: Text(widget.num.toString() ?? "6")),
    );
  }
}
