import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@WidgetBookWidget()
class Button extends StatelessWidget {
  final String text;
  final String subText;

  const Button({
    required this.text,
    required this.subText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red,
      child: Text('$text $subText'),
      onPressed: () {},
    );
  }
}
