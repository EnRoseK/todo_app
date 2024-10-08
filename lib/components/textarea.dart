import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textarea extends StatelessWidget {
  const Textarea({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: 8,
      keyboardType: TextInputType.multiline,
      style: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 16,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 1,
          ),
        ),
        labelText: label,
        labelStyle: GoogleFonts.montserrat(
          color: Colors.white,
          fontSize: 16,
        ),
        alignLabelWithHint: true,
      ),
    );
  }
}
