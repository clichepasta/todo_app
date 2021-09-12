import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_ui_example/provider/todos.dart';
import 'package:todo_app_ui_example/widget/todo_widget.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todoCompleted;
    return todos.isEmpty
        ? Center(
            child: Text(
              'No todo completed.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}
