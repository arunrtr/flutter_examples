import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_temp/home/presentation/detail_screen.dart';
import 'package:test_temp/home/presentation/home_screen.dart';

void main() {

  testWidgets("Home Screen Widget Test", (WidgetTester tester) async{

    await tester.pumpWidget(const MaterialApp(home: DetailScreen()));
    // final appBar = find.byType(AppBar);
    // expect(appBar, findsOneWidget);
    // final text = find.byType(TextField);
    // await tester.enterText(text, "Details");
    // expect(find.text("Details"), findsOneWidget);
    final text = find.byType(TextField);
    expect(text, findsOneWidget);
  });

}