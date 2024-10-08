import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePickerInput extends StatelessWidget {
  const DatePickerInput({
    super.key,
    required this.label,
    required this.controller,
    required this.onTap,
  });

  final String label;
  final TextEditingController controller;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      keyboardType: TextInputType.text,
      style: GoogleFonts.montserrat(
        color: Colors.white,
        fontSize: 16,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffix: const Icon(
          Icons.calendar_today,
          size: 24,
          color: Colors.white,
        ),
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
      ),
    );
  }
}
