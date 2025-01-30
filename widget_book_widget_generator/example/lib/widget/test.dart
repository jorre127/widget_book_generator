import 'package:flutter/material.dart';
import 'package:widget_book_widget_generator_annotations/widget_book_widget_generator_annotations.dart';

@WidgetBookWidget()
class TestWidget extends StatelessWidget {
  final String test1;
  final String test2;
  final bool test3;
  final int? test4;

  const TestWidget({
    required this.test1,
    this.test2 = 'name',
    this.test3 = true,
    this.test4 = 5,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text('$test1 $test2 $test3 $test4');
  }
}
