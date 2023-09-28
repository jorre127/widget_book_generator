import 'package:widget_book_generator_annotations/widget_book_generator_annotations.dart';

@WidgetBookWidget()
class Button {
  final String text;
  final String subText;

  const Button({
    required this.text,
    required this.subText,
  });
}
