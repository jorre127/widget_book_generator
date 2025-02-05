import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/data_type.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/models/widget_field.dart';
import 'package:widget_book_widget_generator/src/models/widget_parameter.dart';
import 'package:widget_book_widget_generator/src/util/extensions/spec_extension.dart';
import 'package:widget_book_widget_generator/src/util/widget_config_extension.dart';

class UseCaseVariableBuilder {
  UseCaseVariableBuilder._();

  static List<Spec> createUseCaseVariables(WidgetConfig config) {
    final widgetConfigs = config.allWidgetConfigs;

    return widgetConfigs
        .map((config) {
          return config.parameters.map(
            (parameter) {
              final index = widgetConfigs.indexOf(config);
              final isParentWidget = index == 0;
              if (config.shouldNotGenerateVariableForParameter(parameter)) return null;
              return Field(
                (fieldBuilder) => fieldBuilder
                  ..name = config.getVariableName(parameter)
                  ..modifier = FieldModifier.var$
                  ..type = Reference(parameter.type.typeString)
                  ..assignment = Code(_buildKnob(field: config.fields[parameter.name]!, parameter: parameter, path: isParentWidget ? null : config.path).toDart()),
              );
            },
          ).whereType<Field>();
        })
        .expand((field) => field)
        .toList();
  }

  static Reference _buildKnob({required WidgetParameter parameter, required WidgetField field, String? path}) {
    final knobName = path == null ? parameter.name : '${parameter.name} (${path})';
    final isNullable = parameter.type.isNullable;
    final defaultValue = field.overridenDefaultValue ?? parameter.defaultValue ?? (isNullable ? 'null' : parameter.type.defaultValue);

    final knob = switch (parameter.type.type) {
      DataTypeEnum.string => "context.knobs.string${isNullable ? 'OrNull' : ''}(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.int => "context.knobs.int${isNullable ? 'OrNull' : ''}.input(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.double => "context.knobs.double${isNullable ? 'OrNull' : ''}.input(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.bool => "context.knobs.boolean${isNullable ? 'OrNull' : ''}(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.color => "context.knobs.color${isNullable ? 'OrNull' : ''}(label: '$knobName', initialValue:$defaultValue )",
      DataTypeEnum.date => "context.knobs.dateTime${isNullable ? 'OrNull' : ''}(label: '$knobName', initialValue: DateTime.now(), start: DateTime(1950, 1,1, 0, 0, 0), end: DateTime(2050, 1, 1, 0, 0, 0))",
      DataTypeEnum.custom || DataTypeEnum.function || DataTypeEnum.key || DataTypeEnum.list || DataTypeEnum.widget => defaultValue,
      DataTypeEnum.enumType => _buildEnumKnob(type: parameter.type, defaultValue: defaultValue, name: knobName),
      null => defaultValue,
    };
    return Reference(knob);
  }

  static String _buildEnumKnob({required DataType type, required String? defaultValue, required String name}) {
    final enumValuesString = type.enumValues?.map((e) => "${type.name.replaceAll('?', '')}.$e").join(', ');
    return "context.knobs.list(label: '${name}', initialOption: $defaultValue, options: [$enumValuesString])";
  }
}
