// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetBookWidgetGenerator
// **************************************************************************

import 'package:example/widget/button.dart';
import 'package:example/widget/test.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'Button',
  type: Button,
)
Widget buttonUseCase(BuildContext context) => Scaffold(
        body: Center(
            child: Button(
      onTapped: () {},
      text: context.knobs.string(label: 'text', initialValue: ''),
      subText: context.knobs.string(label: 'subText', initialValue: ''),
      color: context.knobs.color(label: 'color', initialValue: Colors.blue),
      enabled: context.knobs.boolean(label: 'enabled', initialValue: true),
      key: null,
    )));
@UseCase(
  name: 'TestWidget',
  type: TestWidget,
)
Widget testWidgetUseCase(BuildContext context) => Scaffold(
        body: Center(
            child: TestWidget(
      test1: context.knobs.string(label: 'test1', initialValue: ''),
      test2: context.knobs.string(label: 'test2', initialValue: 'name'),
      test3: context.knobs.boolean(label: 'test3', initialValue: true),
      test4: context.knobs.int.input(label: 'test4', initialValue: 5),
      key: null,
    )));
