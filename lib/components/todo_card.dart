import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/styles/styles.dart';
import 'package:todo_app/utils/datetime_utils.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todo,
  });

  final Todo todo;

  void handleCardTap(BuildContext context) {
    Navigator.pushNamed(
      context,
      "/detail",
      arguments: todo,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        todo.deadline == null ? Styles.primaryColor : Styles.secondaryColor;
    final Color splashColor = todo.deadline == null
        ? Styles.secondaryColor.withOpacity(0.5)
        : Styles.primaryColor.withOpacity(0.5);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: backgroundColor),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: splashColor,
          splashColor: splashColor,
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            handleCardTap(context);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        todo.title,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (todo.deadline != null)
                        const Icon(
                          Icons.access_time_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: Text(
                      todo.description,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Created at ${DateTimeUtils.formatDate(todo.createdDate)}",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
