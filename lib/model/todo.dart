import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui_example/Utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  DateTime createdTime;
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    this.createdTime,
    this.title,
    this.description = '',
    this.id,
    this.isDone = false,
  });
  static Todo fromJson(Map<String, dynamic> json) => Todo(
      createdTime: Utils.fromDateTimeToJson(json['createdTime']),
      title: json['title'],
      description: json['description'],
      id: json['id'],
      isDone: json['isDone']);

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime),
        'title': title,
        'description': description,
        'id': id,
        'isDone': isDone,
      };
}
