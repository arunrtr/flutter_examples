import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_temp/bloc/todo_list_bloc.dart';
import 'package:test_temp/item_provider.dart';
import 'package:test_temp/modal/todo_response.dart';
import 'package:test_temp/screen/todo_add.dart';

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
    blocToDoList.getList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo List"),
      ),
      body: StreamBuilder(
        stream: blocToDoList.subject.stream,
        initialData: const {},
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data is ToDoResponse) {
              List<Item>? arrData = (snapshot.data as ToDoResponse).items;
              return ListView.builder(
                  itemCount: arrData?.length,
                  itemBuilder: (context, index) {
                    final item = arrData?[index];
                    return ListTile(
                      leading: Icon(Icons.favorite),
                      title: Text(item?.title ?? ""),
                      subtitle: Text(item?.description ?? ""),
                      trailing: PopupMenuButton(
                        onSelected: (dynamic) {
                          print("clicked ${dynamic.runtimeType}");
                        },
                        itemBuilder: (context) {
                          return [PopupMenuItem(child: Text("Edit")), PopupMenuItem(child: Text("Delete"))];
                        },
                      ),
                    );
                  });
            }
          } else {
            return Center(child: Text("Something went wrong!"));
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("Add"),
        onPressed: () {
          final routeToDoAdd = MaterialPageRoute(builder: (context) {
            return const ToDoAddScreen();
          });
          Navigator.push(context, routeToDoAdd).then((value) {
            blocToDoList.getList();
          });
        },
      ),
    );
  }
}
