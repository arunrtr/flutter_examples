import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/item_provider.dart';
import 'package:test_temp/screen/todo_add.dart';
import 'package:test_temp/service/api_provider.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo List"),
      ),
      body: Consumer<ItemProvider>(
        builder: (context, itemProviderModal, child) => Visibility(
          visible: itemProviderModal.items.length > 0,
          replacement: Center(child: Text("Please Add")),
          child: ListView.builder(
              itemCount: itemProviderModal.items.length,
              itemBuilder: (context, index) {
                final item = itemProviderModal.items[index];
                return ListTile(
                  leading: Icon(Icons.favorite),
                  title: Text(item["title"]),
                  subtitle: Text(item["description"]),
                  trailing: PopupMenuButton(
                    onSelected: (dynamic) {
                      print("clicked ${dynamic.runtimeType}");
                    },
                    itemBuilder: (context) {
                      return [PopupMenuItem(child: Text("Edit")), PopupMenuItem(child: Text("Delete"))];
                    },
                  ),
                );
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("Add"),
        onPressed: () {
          final routeToDoAdd = MaterialPageRoute(builder: (context) {
            return const ToDoAddScreen();
          });

          Navigator.push(context, routeToDoAdd);
          // then((value) async {
          //   print("After Success $value");
          //   final response = await ApiProvider().getTodoList();
          //   if (response.statusCode == 200) {
          //     print("Get Success ${response.body}");
          //     final result = jsonDecode(response.body);
          //     arrItems = result["items"];
          //     setState(() {});
          //   } else {
          //     print("Get Error ${response.statusCode}");
          //   }
          // });
        },
      ),
    );
  }
}
