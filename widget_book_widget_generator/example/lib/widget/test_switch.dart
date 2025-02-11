import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@widgetBookWidget
class TestSwitch extends StatelessWidget {
  final bool value;
  final Duration duration;
  final ValueChanged<bool> onChanged;

  const TestSwitch({
    required this.value,
    required this.onChanged,
    required this.duration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        height: 24,
        width: 42,
        decoration: BoxDecoration(
          color: value ? Colors.blue : Colors.blueGrey,
          borderRadius: BorderRadius.circular(99999),
        ),
        child: AnimatedAlign(
          duration: duration,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(2),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99999),
            ),
          ),
        ),
      ),
    );
  }
}
