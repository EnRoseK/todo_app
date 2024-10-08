import 'package:flutter/material.dart';
import 'package:todo_app/components/button.dart';
import 'package:todo_app/components/date_picker_input.dart';
import 'package:todo_app/components/input.dart';
import 'package:todo_app/components/textarea.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/styles/styles.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/utils/datetime_utils.dart';
import 'package:todo_app/utils/snackbar_utils.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  DateTime? selectedDeadline;

  void handleSelectDeadline() async {
    DateTime? deadline = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (deadline != null) {
      selectedDeadline = deadline;
      setState(() {
        deadlineController.text = DateTimeUtils.formatDate(deadline);
      });
    }
  }

  void handleSubmitTap() {
    Todo newTodo = Todo(
      title: titleController.text,
      description: descriptionController.text,
      createdDate: DateTime.now(),
      deadline: selectedDeadline,
    );

    context.read<TodoProvider>().addTodo(todo: newTodo);

    SnackbarUtils.showSnackbar("Todo item is created", context);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double paddingBottom = MediaQuery.of(context).viewInsets.bottom + 24;

    return Container(
      padding: const EdgeInsets.all(24).copyWith(
        bottom: paddingBottom,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Styles.primaryColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Input(
            label: "Title",
            controller: titleController,
          ),
          const SizedBox(height: 16),
          Textarea(
            label: "Description",
            controller: descriptionController,
          ),
          const SizedBox(height: 16),
          DatePickerInput(
            label: "Deadline (Optional)",
            controller: deadlineController,
            onTap: handleSelectDeadline,
          ),
          const SizedBox(height: 16),
          Button(
            text: "Add Todo",
            onTap: handleSubmitTap,
          ),
        ],
      ),
    );
  }
}
