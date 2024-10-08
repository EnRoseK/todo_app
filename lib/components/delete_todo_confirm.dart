import 'package:flutter/material.dart';
import 'package:todo_app/components/button.dart';
import "package:provider/provider.dart";
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/utils/snackbar_utils.dart';

class DeleteTodoConfirm extends StatelessWidget {
  const DeleteTodoConfirm({
    super.key,
    required this.todo,
  });

  final Todo todo;

  void handleDeleteTap(BuildContext context) {
    context.read<TodoProvider>().removeTodo(todo: todo);

    SnackbarUtils.showSnackbar("Todo item is deleted", context);
    Navigator.of(context)
      ..pop()
      ..pop();
  }

  void handleCancelTap(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        bottom: 48,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Button(
            text: "Delete Todo",
            onTap: () {
              handleDeleteTap(context);
            },
          ),
          const SizedBox(height: 16),
          Button(
            text: "Cancel",
            onTap: () {
              handleCancelTap(context);
            },
          ),
        ],
      ),
    );
  }
}
