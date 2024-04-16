import 'package:flutter/material.dart';
import 'package:test_temp/home_screen.dart';
import 'package:test_temp/my_inherited_widget.dart';

class LifeCycleParent extends StatefulWidget {
  const LifeCycleParent({Key? key}) : super(key: key);

  @override
  State<LifeCycleParent> createState() => _LifeCycleParentState();
}

class _LifeCycleParentState extends State<LifeCycleParent> {
  late ValueNotifier<int> number;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number = ValueNotifier<int>(0);
    print("Parent- Init");
  }

  @override
  Widget build(BuildContext context) {
    print("Parent- Build");
    String name = MyInheritedWidget.of(context)?.name ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text("LifeCycle"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  print("Reset Pressed");
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
                  // setState(() {
                  //   number.value++;
                  // });
                },
                child: Text("Reset $name")),
            LifeCycleChild(
              number: number,
            )
            // const LifeCycleChild() // it will not call lifecycle method if used as const, only once (at beginning)
          ],
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("Parent - didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant LifeCycleParent oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("Parent - didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Parent - deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Parent - dispose");
  }
}

class LifeCycleChild extends StatefulWidget {
  LifeCycleChild({Key? key, required this.number}) : super(key: key);
  late ValueNotifier<int> number;

  @override
  State<LifeCycleChild> createState() => _LifeCycleChildState();
}

class _LifeCycleChildState extends State<LifeCycleChild> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Child- Init");
  }

  @override
  Widget build(BuildContext context) {
    print("Child- Build");

    return ValueListenableBuilder(
      valueListenable: widget.number,
      builder: (ctx, number, _) {
        return Text("Value is $number");
      },
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("Child - didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant LifeCycleChild oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("Child - didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Child - deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Child - dispose");
  }
}
