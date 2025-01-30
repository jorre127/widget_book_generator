import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/data_type.dart';
import 'package:widget_book_widget_generator/src/models/parameter.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';

class WidgetBuilder {
  static Expression buildWidget({required String name, required Expression child, String? childParameterName}) =>
      Reference(name).newInstance([], {'${childParameterName ?? 'child'}': child});

  static Expression buildWidgetFromConf(WidgetConfig child) {
    return Reference(child.name).newInstance(
      [],
      Map.fromEntries(
          child.parameters.where((parameter) => parameter.isNamed && parameter.type.type != DataTypeEnum.key).map((parameter) => MapEntry(parameter.name, _buildKnob(parameter)))),
    );
  }

  static Reference _buildKnob(WidgetParameter parameter) {
    final defaultValue = parameter.defaultValue ?? parameter.type.defaultValue;
    final knob = switch (parameter.type.type) {
      DataTypeEnum.string => "context.knobs.string(label: '${parameter.name}', initialValue:${defaultValue} )",
      DataTypeEnum.int => "context.knobs.int.input(label: '${parameter.name}', initialValue:${defaultValue} )",
      DataTypeEnum.double => "context.knobs.double.input(label: '${parameter.name}', initialValue:${defaultValue} )",
      DataTypeEnum.bool => "context.knobs.boolean(label: '${parameter.name}', initialValue:${defaultValue} )",
      DataTypeEnum.color => "context.knobs.color(label: '${parameter.name}', initialValue:${defaultValue} )",
      DataTypeEnum.date => "context.knobs.dateTime(label: '${parameter.name}', initialValue:${defaultValue} )",
      DataTypeEnum.custom || DataTypeEnum.function || DataTypeEnum.key || DataTypeEnum.list => defaultValue,
      null => defaultValue,
    };
    return Reference(knob);
  }
}
