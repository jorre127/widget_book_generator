// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetBookWidgetGenerator
// **************************************************************************

// ignore_for_file: prefer_function_declarations_over_variables

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
Widget testProgressIndicatorUseCase(BuildContext context) {
  bool testProgressIndicatorDark =
      context.knobs.boolean(label: 'dark', initialValue: true);

  return Scaffold(
      body: Center(
          child: TestProgressIndicator(dark: testProgressIndicatorDark)));
}

@UseCase(
  name: 'TestButton',
  type: TestButton,
)
Widget testButtonUseCase(BuildContext context) {
  String testButtonText =
      context.knobs.string(label: 'text', initialValue: 'Override');

  void Function()? testButtonOnClick = () {};

  bool testButtonIsExpanded =
      context.knobs.boolean(label: 'isExpanded', initialValue: true);

  bool testButtonIsEnabled =
      context.knobs.boolean(label: 'isEnabled', initialValue: false);

  ButtonType testButtonButtonType = context.knobs.list(
      label: 'buttonType',
      initialOption: ButtonType.regular,
      options: [ButtonType.regular, ButtonType.text]);

  return Scaffold(
      body: Center(
          child: TestButton(
    text: testButtonText,
    onClick: testButtonOnClick,
    isExpanded: testButtonIsExpanded,
    isEnabled: testButtonIsEnabled,
    buttonType: testButtonButtonType,
  )));
}

@UseCase(
  name: 'FlutterTemplateInputField',
  type: FlutterTemplateInputField,
)
Widget flutterTemplateInputFieldUseCase(BuildContext context) {
  String flutterTemplateInputFieldHint =
      context.knobs.string(label: 'hint', initialValue: '');

  void Function(String) flutterTemplateInputFieldOnChanged = (String value) {};

  List<String>? flutterTemplateInputFieldAutoFillHints = const [];

  bool flutterTemplateInputFieldEnabled =
      context.knobs.boolean(label: 'enabled', initialValue: true);

  String? textEditingControllerText = context.knobs
      .string(label: 'text (TextEditingController)', initialValue: '');

  return Scaffold(
      body: Center(
          child: FlutterTemplateInputField(
    hint: flutterTemplateInputFieldHint,
    onChanged: flutterTemplateInputFieldOnChanged,
    autoFillHints: flutterTemplateInputFieldAutoFillHints,
    enabled: flutterTemplateInputFieldEnabled,
    controller: TextEditingController(text: textEditingControllerText),
  )));
}

@UseCase(
  name: 'TestBackButton',
  type: TestBackButton,
)
Widget testBackButtonUseCase(BuildContext context) {
  void Function()? testBackButtonOnClick = () {};

  bool testBackButtonIsLight =
      context.knobs.boolean(label: 'isLight', initialValue: true);

  bool testBackButtonFullScreen =
      context.knobs.boolean(label: 'fullScreen', initialValue: false);

  void Function()? testBackButtonDataOnClick = () {};

  bool testBackButtonDataIsLight = context.knobs
      .boolean(label: 'isLight (TestBackButtonData)', initialValue: true);

  bool testBackButtonDataFullScreen = context.knobs
      .boolean(label: 'fullScreen (TestBackButtonData)', initialValue: false);

  return Scaffold(
      body: Center(
          child: TestBackButton(
    onClick: testBackButtonOnClick,
    data: TestBackButtonData(
      onClick: testBackButtonDataOnClick,
      isLight: testBackButtonDataIsLight,
      fullScreen: testBackButtonDataFullScreen,
    ),
    isLight: testBackButtonIsLight,
    fullScreen: testBackButtonFullScreen,
  )));
}

@UseCase(
  name: 'TestCheckBox',
  type: TestCheckBox,
)
Widget testCheckBoxUseCase(BuildContext context) {
  bool testCheckBoxValue =
      context.knobs.boolean(label: 'value', initialValue: true);

  void Function(bool) testCheckBoxOnChanged = (bool value) {};

  return Scaffold(
      body: Center(
          child: TestCheckBox(
    value: testCheckBoxValue,
    onChanged: testCheckBoxOnChanged,
  )));
}

@UseCase(
  name: 'TestSwitch',
  type: TestSwitch,
)
Widget testSwitchUseCase(BuildContext context) {
  bool testSwitchValue =
      context.knobs.boolean(label: 'value', initialValue: true);

  void Function(bool) testSwitchOnChanged = (bool value) {};

  return Scaffold(
      body: Center(
          child: TestSwitch(
    value: testSwitchValue,
    onChanged: testSwitchOnChanged,
  )));
}
