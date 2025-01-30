import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@WidgetBookWidget()
class TestBackButton extends StatelessWidget {
  final VoidCallback? onClick;
  final bool fullScreen;
  final bool isLight;

  const TestBackButton({
    required this.onClick,
    this.isLight = true,
    this.fullScreen = false,
    super.key,
  });

  const TestBackButton.light({
    required this.onClick,
    this.fullScreen = false,
    super.key,
  }) : isLight = true;

  const TestBackButton.dark({
    required this.onClick,
    this.fullScreen = false,
    super.key,
  }) : isLight = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Icon(
        getCorrectIcon(context),
        color: isLight ? Colors.white : Colors.blue,
      ),
    );
  }

  IconData getCorrectIcon(BuildContext context) {
    if (fullScreen) {
      return Icons.close;
    }
    return Icons.arrow_left;
  }
}
