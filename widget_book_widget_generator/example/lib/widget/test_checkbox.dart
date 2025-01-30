import 'dart:io';

import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@WidgetBookWidget()
class TestCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const TestCheckBox({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return GestureDetector(
        onTap: () => onChanged(!value),
        child: Container(
          color: Colors.transparent,
          height: 48,
          width: 48,
          child: value
              ? const Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.blue,
                    size: 24,
                  ),
                )
              : Container(),
        ),
      );
    }
    return Checkbox(
      value: value,
      onChanged: (value) => onChanged(value ?? false),
      activeColor: Colors.blue,
    );
  }
}
