

import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@WidgetBookWidget()
class Test {
  final String test1;
  final String test2;
  final bool test3;
  final int? test4;

  const Test({
    required this.test1,
    this.test2 = 'name',
    this.test3 = true,
    this.test4 = 5,
  });
}
