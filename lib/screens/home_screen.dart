import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/components/todo_card.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/screens/add_todo_screen.dart';
import 'package:todo_app/styles/styles.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  void showAddTodoScreen(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => const AddTodoScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Todo> todos = context.watch<TodoProvider>().todos;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: SvgPicture.asset("assets/svg/header.svg"),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            showAddTodoScreen(context);
          },
          backgroundColor: Styles.secondaryColor,
          elevation: 0,
          highlightElevation: 0,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/small-logo.svg",
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "List of Todo",
                        style: GoogleFonts.bebasNeue(
                          fontSize: 36,
                          color: Styles.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_alt_outlined,
                    size: 28,
                    color: Styles.secondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => TodoCard(
                  key: ValueKey(todos[index]),
                  todo: todos[index],
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(key: ValueKey(index), height: 16),
                itemCount: todos.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
