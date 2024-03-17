import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    theme: ThemeData.dark(),
    home: TestScreen(),
  ));
}

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final ScrollController _scrollController = ScrollController();
  List<dynamic> arrData = [];
  int skip = 0;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    fetchData(skip);
    _scrollController.addListener(() {
      if (isLoadingMore) return;
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        print("Api Called");
        skip += 20;
        isLoadingMore = true;
        fetchData(skip);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination"),
      ),
      body: arrData.isNotEmpty
          ? ListView.builder(
              controller: _scrollController,
              itemCount: isLoadingMore ? arrData.length + 1 : arrData.length,
              itemBuilder: (ctx, index) {
                Map<String, dynamic> data = arrData[index];
                if (index + 1 == arrData.length) {
                  //last index
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListTile(
                    leading: Text(data["id"].toString()),
                    title: Text(data["title"]),
                    subtitle: Text(data["description"]),
                  );
                }
              })
          : CircularProgressIndicator(),
    );
  }

  fetchData(int skip) async {
    Dio dio = Dio();
    final response = await dio.get("https://dummyjson.com/products?limit=20&skip=$skip");
    final result = response.data;
    setState(() {
      arrData = arrData + result["products"]; // important: data
      // should be appended to previous array
      isLoadingMore = false;
    });
  }
}
