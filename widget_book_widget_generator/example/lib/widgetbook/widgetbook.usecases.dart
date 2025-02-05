// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetBookWidgetGenerator
// **************************************************************************

// ignore_for_file: prefer_function_declarations_over_variables, prefer_final_locals, omit_local_variable_types, prefer_int_literals, avoid_types_on_closure_parameters, avoid_positional_boolean_parameters, prefer_const_constructors, avoid_init_to_null

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
  name: 'TestButton',
  type: TestButton,
)
Widget testButtonUseCase(BuildContext context) {
  String text = context.knobs.string(label: 'text', initialValue: 'Override');

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
  name: 'FlutterTemplateInputField',
  type: FlutterTemplateInputField,
)
Widget flutterTemplateInputFieldUseCase(BuildContext context) {
  String hint = context.knobs.string(label: 'hint', initialValue: '');

  void Function(String) onChanged = (String value) {};

  List<String>? autoFillHints = null;

  bool enabled = context.knobs.boolean(label: 'enabled', initialValue: true);

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

  return Center(
      child: TestBackButton(
    onClick: onClick,
    data: TestBackButtonData(
      onClick: dataOnClick,
      subData: TestBackButtonSubData(enabled: dataSubDataEnabled),
      fullScreen: dataFullScreen,
      isLight: dataIsLight,
    ),
    isLight: isLight,
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

  return Center(
      child: TestSwitch(
    value: value,
    onChanged: onChanged,
  ));
}
