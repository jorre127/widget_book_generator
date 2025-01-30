// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetBookWidgetGenerator
// **************************************************************************

import 'package:example/widget/flutter_template_input_field.dart';
import 'package:example/widget/test_back_button.dart';
import 'package:example/widget/test_button.dart';
import 'package:example/widget/test_checkbox.dart';
import 'package:example/widget/test_progress_indicator.dart';
import 'package:example/widget/test_switch.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@UseCase(
  name: 'TestProgressIndicator',
  type: TestProgressIndicator,
)
Widget testProgressIndicatorUseCase(BuildContext context) => Scaffold(
    body: Center(
        child: TestProgressIndicator(
            dark: context.knobs.boolean(label: 'dark', initialValue: true))));
@UseCase(
  name: 'TestButton',
  type: TestButton,
)
Widget testButtonUseCase(BuildContext context) => Scaffold(
        body: Center(
            child: TestButton(
      text: context.knobs.string(label: 'text', initialValue: ''),
      onClick: () {},
      isExpanded:
          context.knobs.boolean(label: 'isExpanded', initialValue: true),
      isEnabled: context.knobs.boolean(label: 'isEnabled', initialValue: true),
      buttonType: ButtonType.regular,
    )));
@UseCase(
  name: 'FlutterTemplateInputField',
  type: FlutterTemplateInputField,
)
Widget flutterTemplateInputFieldUseCase(BuildContext context) => Scaffold(
        body: Center(
            child: FlutterTemplateInputField(
      hint: context.knobs.string(label: 'hint', initialValue: ''),
      onChanged: (String value) {},
      autoFillHints: const [],
      enabled: context.knobs.boolean(label: 'enabled', initialValue: true),
      controller: null,
    )));
@UseCase(
  name: 'TestBackButton',
  type: TestBackButton,
)
Widget testBackButtonUseCase(BuildContext context) => Scaffold(
        body: Center(
            child: TestBackButton(
      onClick: () {},
      isLight: context.knobs.boolean(label: 'isLight', initialValue: true),
      fullScreen:
          context.knobs.boolean(label: 'fullScreen', initialValue: false),
    )));
@UseCase(
  name: 'TestCheckBox',
  type: TestCheckBox,
)
Widget testCheckBoxUseCase(BuildContext context) => Scaffold(
        body: Center(
            child: TestCheckBox(
      value: context.knobs.boolean(label: 'value', initialValue: true),
      onChanged: (bool value) {},
    )));
@UseCase(
  name: 'TestSwitch',
  type: TestSwitch,
)
Widget testSwitchUseCase(BuildContext context) => Scaffold(
        body: Center(
            child: TestSwitch(
      value: context.knobs.boolean(label: 'value', initialValue: true),
      onChanged: (bool value) {},
    )));
