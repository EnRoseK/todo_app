import 'package:flutter/material.dart';

class SnackbarUtils {
  static void showSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(
          seconds: 3,
        ),
      ),
    );
  }
}
