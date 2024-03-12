// To parse this JSON data, do
//
//     final toDoItem = toDoItemFromJson(jsonString);

import 'dart:convert';

List<ToDoItem> toDoItemFromJson(String str) => List<ToDoItem>.from(json.decode(str).map((x) => ToDoItem.fromJson(x)));

String toDoItemToJson(List<ToDoItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ToDoItem {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? title;
  String? description;
  bool? isCompleted;

  ToDoItem({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.title,
    this.description,
    this.isCompleted,
  });

  factory ToDoItem.fromJson(Map<String, dynamic> json) => ToDoItem(
    id: json["_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    title: json["title"],
    description: json["description"],
    isCompleted: json["is_completed"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "title": title,
    "description": description,
    "is_completed": isCompleted,
  };
}
