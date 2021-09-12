import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_app_ui_example/api/firebase_api.dart';
import 'package:todo_app_ui_example/model/todo.dart';

class TodosProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todoCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();
  void addTodo(Todo todo) => FirebaseApi.createTodo(todo);

  void setTodos(List<Todo> todos) {
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      _todos = todos;
      notifyListeners();
    });
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toogleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}
