import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

class BaseBackButtonData {
  final bool fullScreen;
  final bool isLight;

  const BaseBackButtonData({
    required this.fullScreen,
    required this.isLight,
  });
}

class TestBackButtonData extends BaseBackButtonData {
  final TestBackButtonSubData subData;
  final VoidCallback? onClick;

  const TestBackButtonData({
    required this.onClick,
    required this.subData,
    required bool fullScreen,
    required bool isLight,
  }) : super(
          fullScreen: fullScreen,
          isLight: isLight,
        );
}

class TestBackButtonSubData {
  final bool enabled;

  const TestBackButtonSubData({
    required this.enabled,
  });
}

@widgetBookWidget
class TestBackButton extends StatelessWidget {
  final VoidCallback? onClick;
  final bool fullScreen;
  final bool isLight;
  final TestBackButtonData? data;

  const TestBackButton({
    required this.onClick,
    this.data,
    this.isLight = true,
    this.fullScreen = false,
    super.key,
  });

  const TestBackButton.light({
    required this.onClick,
    this.data,
    this.fullScreen = false,
    super.key,
  }) : isLight = true;

  const TestBackButton.dark({
    required this.onClick,
    this.data,
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
