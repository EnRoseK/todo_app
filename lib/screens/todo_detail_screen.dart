import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/components/delete_todo_confirm.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/edit_todo_screen.dart';
import 'package:todo_app/styles/styles.dart';
import 'package:todo_app/utils/datetime_utils.dart';

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({super.key});

  void handleDeadlineTap(BuildContext context, Todo todo) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Deadline"),
          content: Text(
              "This task is scheduled to finish as of ${DateTimeUtils.formatDate(todo.deadline!)}"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Okay"),
            ),
          ],
        );
      },
    );
  }

  void handleEditTap(BuildContext context, Todo todo) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return EditTodoScreen(todo: todo);
      },
    );
  }

  void handleDeleteTap(BuildContext context, Todo todo) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return DeleteTodoConfirm(todo: todo);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Todo todo = ModalRoute.of(context)?.settings.arguments as Todo;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: todo.deadline == null
                ? null
                : () {
                    handleDeadlineTap(context, todo);
                  },
            icon: const Icon(
              Icons.access_time_outlined,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              handleEditTap(context, todo);
            },
            icon: const Icon(
              Icons.edit_outlined,
              size: 24,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {
                handleDeleteTap(context, todo);
              },
              icon: const Icon(
                Icons.delete_outline,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                todo.title.toUpperCase(),
                style: GoogleFonts.bebasNeue(
                  color: Styles.darkColor,
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    todo.description,
                    style: GoogleFonts.montserrat(
                      color: Styles.darkColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Created at ${DateTimeUtils.formatDate(todo.createdDate)}",
              style: GoogleFonts.montserrat(
                color: Styles.darkColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
