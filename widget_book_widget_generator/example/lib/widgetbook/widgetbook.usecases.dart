// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetBookWidgetGenerator
// **************************************************************************

// ignore_for_file: prefer_function_declarations_over_variables, prefer_final_locals, omit_local_variable_types, prefer_int_literals, avoid_types_on_closure_parameters, avoid_positional_boolean_parameters, prefer_const_constructors, avoid_init_to_null, unnecessary_import, prefer_collection_literals

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
  bool dark = context.knobs.boolean(label: 'dark', initialValue: true);

  return Center(child: TestProgressIndicator(dark: dark));
}

@UseCase(
  name: 'TestProgressIndicator (dark)',
  type: TestProgressIndicator,
)
Widget testProgressIndicatorUseCaseDark(BuildContext context) {
  return Center(child: TestProgressIndicator.dark());
}

@UseCase(
  name: 'TestProgressIndicator (light)',
  type: TestProgressIndicator,
)
Widget testProgressIndicatorUseCaseLight(BuildContext context) {
  return Center(child: TestProgressIndicator.light());
}

@UseCase(
  name: 'TestButton',
  type: TestButton,
)
Widget testButtonUseCase(BuildContext context) {
  String text = context.knobs.string(label: 'text', initialValue: '{text}');

  void Function()? onClick = null;

  bool isExpanded =
      context.knobs.boolean(label: 'isExpanded', initialValue: true);

  bool isEnabled =
      context.knobs.boolean(label: 'isEnabled', initialValue: false);

  ButtonType buttonType = context.knobs.list(
      label: 'buttonType',
      initialOption: ButtonType.regular,
      options: [ButtonType.regular, ButtonType.text]);

  return Center(
      child: TestButton(
    text: text,
    onClick: onClick,
    isExpanded: isExpanded,
    isEnabled: isEnabled,
    buttonType: buttonType,
  ));
}

@UseCase(
  name: 'TestButton (text)',
  type: TestButton,
)
Widget testButtonUseCaseText(BuildContext context) {
  String text = context.knobs.string(label: 'text', initialValue: '{text}');

  void Function()? onClick = null;

  bool isExpanded =
      context.knobs.boolean(label: 'isExpanded', initialValue: false);

  bool isEnabled =
      context.knobs.boolean(label: 'isEnabled', initialValue: false);

  ButtonType buttonType = context.knobs.list(
      label: 'buttonType',
      initialOption: ButtonType.text,
      options: [ButtonType.regular, ButtonType.text]);

  return Center(
      child: TestButton.text(
    text: text,
    onClick: onClick,
    isExpanded: isExpanded,
    isEnabled: isEnabled,
    buttonType: buttonType,
  ));
}

@UseCase(
  name: 'FlutterTemplateInputField',
  type: FlutterTemplateInputField,
)
Widget flutterTemplateInputFieldUseCase(BuildContext context) {
  String hint = context.knobs.list(
      label: 'hint',
      initialOption: 'emailAddress',
      options: ['emailAddress', 'username', 'password']);

  void Function(String) onChanged = (String value) {};

  List<String>? autoFillHints = null;

  bool enabled = context.knobs
      .list(label: 'enabled', initialOption: true, options: [true, false]);

  String? controllerText = context.knobs
      .stringOrNull(label: 'text (controller)', initialValue: null);

  return Center(
      child: FlutterTemplateInputField(
    hint: hint,
    onChanged: onChanged,
    autoFillHints: autoFillHints,
    enabled: enabled,
    controller: TextEditingController(text: controllerText),
  ));
}

@UseCase(
  name: 'TestBackButton',
  type: TestBackButton,
)
Widget testBackButtonUseCase(BuildContext context) {
  void Function()? onClick = null;

  bool isLight = context.knobs.boolean(label: 'isLight', initialValue: true);

  bool fullScreen =
      context.knobs.boolean(label: 'fullScreen', initialValue: false);

  void Function()? dataOnClick = null;

  bool dataFullScreen =
      context.knobs.boolean(label: 'fullScreen (data)', initialValue: true);

  bool dataIsLight =
      context.knobs.boolean(label: 'isLight (data)', initialValue: true);

  bool dataSubDataEnabled = context.knobs
      .boolean(label: 'enabled (data/subData)', initialValue: true);

  bool dataValueNotifierValue = context.knobs
      .boolean(label: '_value (data/valueNotifier)', initialValue: true);

  return Center(
      child: TestBackButton(
    onClick: onClick,
    data: TestBackButtonData(
      onClick: dataOnClick,
      subData: TestBackButtonSubData(enabled: dataSubDataEnabled),
      valueNotifier: ValueNotifier(dataValueNotifierValue),
      fullScreen: dataFullScreen,
      isLight: dataIsLight,
    ),
    isLight: isLight,
    fullScreen: fullScreen,
  ));
}

@UseCase(
  name: 'TestBackButton (light)',
  type: TestBackButton,
)
Widget testBackButtonUseCaseLight(BuildContext context) {
  void Function()? onClick = null;

  bool fullScreen =
      context.knobs.boolean(label: 'fullScreen', initialValue: false);

  void Function()? dataOnClick = null;

  bool dataFullScreen =
      context.knobs.boolean(label: 'fullScreen (data)', initialValue: true);

  bool dataIsLight =
      context.knobs.boolean(label: 'isLight (data)', initialValue: true);

  bool dataSubDataEnabled = context.knobs
      .boolean(label: 'enabled (data/subData)', initialValue: true);

  bool dataValueNotifierValue = context.knobs
      .boolean(label: '_value (data/valueNotifier)', initialValue: true);

  return Center(
      child: TestBackButton.light(
    onClick: onClick,
    data: TestBackButtonData(
      onClick: dataOnClick,
      subData: TestBackButtonSubData(enabled: dataSubDataEnabled),
      valueNotifier: ValueNotifier(dataValueNotifierValue),
      fullScreen: dataFullScreen,
      isLight: dataIsLight,
    ),
    fullScreen: fullScreen,
  ));
}

@UseCase(
  name: 'TestBackButton (dark)',
  type: TestBackButton,
)
Widget testBackButtonUseCaseDark(BuildContext context) {
  void Function()? onClick = null;

  bool fullScreen =
      context.knobs.boolean(label: 'fullScreen', initialValue: false);

  void Function()? dataOnClick = null;

  bool dataFullScreen =
      context.knobs.boolean(label: 'fullScreen (data)', initialValue: true);

  bool dataIsLight =
      context.knobs.boolean(label: 'isLight (data)', initialValue: true);

  bool dataSubDataEnabled = context.knobs
      .boolean(label: 'enabled (data/subData)', initialValue: true);

  bool dataValueNotifierValue = context.knobs
      .boolean(label: '_value (data/valueNotifier)', initialValue: true);

  return Center(
      child: TestBackButton.dark(
    onClick: onClick,
    data: TestBackButtonData(
      onClick: dataOnClick,
      subData: TestBackButtonSubData(enabled: dataSubDataEnabled),
      valueNotifier: ValueNotifier(dataValueNotifierValue),
      fullScreen: dataFullScreen,
      isLight: dataIsLight,
    ),
    fullScreen: fullScreen,
  ));
}

@UseCase(
  name: 'TestCheckBox',
  type: TestCheckBox,
)
Widget testCheckBoxUseCase(BuildContext context) {
  bool value = context.knobs.boolean(label: 'value', initialValue: true);

  void Function(bool) onChanged = (bool value) {};

  return Center(
      child: TestCheckBox(
    value: value,
    onChanged: onChanged,
  ));
}

@UseCase(
  name: 'TestSwitch',
  type: TestSwitch,
)
Widget testSwitchUseCase(BuildContext context) {
  bool value = context.knobs.boolean(label: 'value', initialValue: true);

  void Function(bool) onChanged = (bool value) {};

  int durationDays =
      context.knobs.int.input(label: 'days (duration)', initialValue: 0);

  int durationHours =
      context.knobs.int.input(label: 'hours (duration)', initialValue: 0);

  int durationMinutes =
      context.knobs.int.input(label: 'minutes (duration)', initialValue: 0);

  int durationSeconds =
      context.knobs.int.input(label: 'seconds (duration)', initialValue: 0);

  int durationMilliseconds = context.knobs.int
      .input(label: 'milliseconds (duration)', initialValue: 0);

  int durationMicroseconds = context.knobs.int
      .input(label: 'microseconds (duration)', initialValue: 0);

  return Center(
      child: TestSwitch(
    value: value,
    onChanged: onChanged,
    duration: Duration(
      days: durationDays,
      hours: durationHours,
      minutes: durationMinutes,
      seconds: durationSeconds,
      milliseconds: durationMilliseconds,
      microseconds: durationMicroseconds,
    ),
  ));
}
