import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  TodoProvider({List<Todo>? todos}) : todos = todos ?? [];

  List<Todo> todos;

  void addTodo({required Todo todo}) async {
    todos.add(todo);
    notifyListeners();
  }

  void updateTodo({required Todo oldTodo, required Todo todo}) async {
    int indexOfOldTodo = todos.indexOf(oldTodo);
    todos[indexOfOldTodo] = todo;
    notifyListeners();
  }

  void removeTodo({required Todo todo}) async {
    todos.remove(todo);
    notifyListeners();
  }
}
