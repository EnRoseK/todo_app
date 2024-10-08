import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/todo_detail_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TodoProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/home": (context) => const HomeScreen(),
          "/detail": (context) => const TodoDetailScreen()
        },
        initialRoute: "/home",
      ),
    );
  }
}
