import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@widgetBookWidget
class FlutterTemplateInputField extends StatelessWidget {
  final bool enabled;
  final String hint;
  final List<String>? autoFillHints;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const FlutterTemplateInputField({
    required this.hint,
    required this.onChanged,
    this.autoFillHints,
    this.enabled = true,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      onChanged: onChanged,
      autofillHints: autoFillHints,
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        fillColor: Colors.white,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
