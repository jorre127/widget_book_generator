import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@WidgetBookWidget()
class TestProgressIndicator extends StatelessWidget {
  final bool dark;

  const TestProgressIndicator({
    required this.dark,
    super.key,
  });

  const TestProgressIndicator.dark({super.key}) : dark = true;

  const TestProgressIndicator.light({super.key}) : dark = false;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(dark ? Colors.blue : Colors.white),
    );
  }
}
