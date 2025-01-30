import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@WidgetBookWidget()
class Button extends StatelessWidget {
  final bool enabled;
  final Color color;
  final String text;
  final String subText;
  final VoidCallback onTapped;

  const Button({
    required this.onTapped,
    required this.text,
    required this.subText,
    required this.color,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: MaterialButton(
        color: color,
        onPressed: onTapped,
        child: Text('$text $subText'),
      ),
    );
  }
}
