import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/data_type.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/models/widget_field.dart';
import 'package:widget_book_widget_generator/src/models/widget_parameter.dart';
import 'package:widget_book_widget_generator/src/util/case_util.dart';
import 'package:widget_book_widget_generator/src/util/extensions/spec_extension.dart';

class UseCaseVariableBuilder {
  UseCaseVariableBuilder._();

  static List<Spec> createUseCaseVariables(WidgetConfig config) {
    final widgetConfigs = _getAllWidgetConfigs(config);

    return widgetConfigs
        .map((config) {
          return config.parameters.map(
            (parameter) {
              final field = config.fields[parameter.name];
              final index = widgetConfigs.indexOf(config);
              final isParentWidget = index == 0;
              if (field == null || parameter.type.type == DataTypeEnum.custom || field.ignore) return null;
              return Field(
                (fieldBuilder) => fieldBuilder
                  ..name = CaseUtil('${config.name} ${parameter.name} ${parameter.id}').camelCase
                  ..modifier = FieldModifier.var$
                  ..type = Reference(parameter.type.typeString)
                  ..assignment = Code(_buildKnob(field: config.fields[parameter.name]!, parameter: parameter, widgetName: isParentWidget ? null : config.name).toDart()),
              );
            },
          ).whereType<Field>();
        })
        .expand((field) => field)
        .toList();
  }

  static List<WidgetConfig> _getAllWidgetConfigs(WidgetConfig config) {
    final allConfigs =
        config.widgetConfigs.values.expand((element) => [element, ...element.widgetConfigs.entries.map((config) => _getAllWidgetConfigs(config.value)).expand((config) => config)]);

    return [config, ...allConfigs];
  }

  static Reference _buildKnob({required WidgetParameter parameter, required WidgetField field, String? widgetName}) {
    final defaultValue = field.overridenDefaultValue ?? parameter.defaultValue ?? parameter.type.defaultValue;
    final knobName = widgetName == null ? parameter.name : '${parameter.name} (${widgetName})';

    final knob = switch (parameter.type.type) {
      DataTypeEnum.string => "context.knobs.string(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.int => "context.knobs.int.input(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.double => "context.knobs.double.input(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.bool => "context.knobs.boolean(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.color => "context.knobs.color(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.date => "context.knobs.dateTime(label: '$knobName', initialValue:${defaultValue} )",
      DataTypeEnum.custom || DataTypeEnum.function || DataTypeEnum.key || DataTypeEnum.list || DataTypeEnum.widget => defaultValue,
      DataTypeEnum.enumType => _buildEnumKnob(type: parameter.type, defaultValue: defaultValue, name: knobName),
      null => defaultValue,
    };
    return Reference(knob);
  }

  static String _buildEnumKnob({required DataType type, required String defaultValue, required String name}) {
    final enumValuesString = type.enumValues?.map((e) => "${type.name}.$e").join(', ');
    return "context.knobs.list(label: '${name}', initialOption: $defaultValue, options: [$enumValuesString])";
  }
}
