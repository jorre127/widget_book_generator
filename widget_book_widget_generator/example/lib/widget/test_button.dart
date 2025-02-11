import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

enum ButtonType {
  regular,
  text,
}

@widgetBookWidget
class TestButton extends StatelessWidget {
  @WidgetBookWidgetField(defaultValue: 'Override')
  final String text;
  @WidgetBookWidgetField(defaultValue: false)
  final bool isEnabled;
  final bool isExpanded;
  final VoidCallback? onClick;
  final ButtonType buttonType;

  const TestButton({
    required this.text,
    required this.onClick,
    this.isExpanded = true,
    this.isEnabled = true,
    this.buttonType = ButtonType.regular,
    super.key,
  });

  const TestButton.text({
    required this.text,
    required this.onClick,
    this.isExpanded = false,
    this.isEnabled = true,
    this.buttonType = ButtonType.text,
    super.key,
  });

  TextStyle _enabledTextStyle(ThemeData theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );
      case ButtonType.text:
        return const TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );
    }
  }

  TextStyle _disabledTextStyle(ThemeData theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );
      case ButtonType.text:
        return const TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        );
    }
  }

  Color? _enabledButtonColor(ThemeData theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return Colors.blue;
      case ButtonType.text:
        return null;
    }
  }

  Color? _disabledButtonColor(ThemeData theme) {
    switch (buttonType) {
      case ButtonType.regular:
        return Colors.grey;
      case ButtonType.text:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = Row(
      mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: AnimatedDefaultTextStyle(
            style: isEnabled ? _enabledTextStyle(theme) : _disabledTextStyle(theme),
            duration: const Duration(milliseconds: 500),
            child: Text(text),
          ),
        ),
      ],
    );
    if (!kIsWeb && Platform.isIOS) {
      return GestureDetector(
        onTap: isEnabled ? onClick : null,
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(milliseconds: 500),
          child: content,
        ),
      );
    }
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: isEnabled ? _enabledButtonColor(theme) : _disabledButtonColor(theme),
        borderRadius: BorderRadius.circular(12),
      ),
      duration: const Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: isEnabled ? onClick : null,
        child: content,
      ),
    );
  }
}
