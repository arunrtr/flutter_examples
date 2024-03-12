import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_temp/item_provider.dart';
import 'package:test_temp/service/api_provider.dart';

class ToDoAddScreen extends StatefulWidget {
  const ToDoAddScreen({Key? key}) : super(key: key);

  @override
  State<ToDoAddScreen> createState() => _ToDoAddScreenState();
}

class _ToDoAddScreenState extends State<ToDoAddScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo Add"),
      ),
      body: ListView(
        children:  [
           TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              hintText: "Task Name"
            ),
          ),
           TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              hintText: "Add Description"
            ),
            maxLines: 5,
          ),
          Consumer <ItemProvider>(
            builder:(context,itemProvider,child) => ElevatedButton(onPressed: () async {
              print("submit pressed");
              final response = await ApiProvider().saveTask({
                "title": _titleController.text,
                "description": _descriptionController.text,
                "is_completed": false
              });
              if(response.statusCode == 201) {
                _titleController.text = "";
                _descriptionController.text = "";
                print("Saved Successfully");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Saved Succesfully")));
                // Future.delayed(const Duration(seconds: 2));
                // Navigator.of(context).pop();

                final response = await ApiProvider().getTodoList();
                if (response.statusCode == 200) {
                  print("Get Success ${response.body}");
                  final result = jsonDecode(response.body);
                  itemProvider.addItem(result["items"]);
                }


              }else {
                print("Error Status Code = ${response.statusCode}");
              }

            }, child: const Text("Submit")),
          )

        ],
      ),
    );
  }
}
