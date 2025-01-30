// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetBookWidgetGenerator
// **************************************************************************

import 'package:example/widget/button.dart';
import 'package:example/widget/test.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Button',
  type: Button,
)
Widget buttonUseCase(BuildContext context) => const Scaffold(
        body: Center(
            child: Button(
      text: '',
      subText: '',
      key: null,
    )));
@UseCase(
  name: 'TestWidget',
  type: TestWidget,
)
Widget testWidgetUseCase(BuildContext context) => const Scaffold(
        body: Center(
            child: TestWidget(
      test1: '',
      test2: 'name',
      test3: true,
      test4: 5,
      key: null,
    )));
