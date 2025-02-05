import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/data_type.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/models/widget_parameter.dart';

class WidgetBuilder {
  static Expression buildWidget({required String name, required Expression child, String? childParameterName}) =>
      Reference(name).newInstance([], {'${childParameterName ?? 'child'}': child});

  static Expression buildWidgetFromConf(WidgetConfig child) {
    final namedParameters = child.parameters.where((parameter) => parameter.isNamed && parameter.type.type != DataTypeEnum.key);
    final unnamedParameters = child.parameters.where((parameter) => !parameter.isNamed && parameter.type.type != DataTypeEnum.key);
    return Reference(child.name).newInstance(
      unnamedParameters.map((parameter) {
        final value = _getValue(child: child, parameter: parameter);
        if (value == null) return null;

        return value;
      }).whereType<Expression>(),
      Map.fromEntries(
        namedParameters.map(
          (parameter) {
            final value = _getValue(child: child, parameter: parameter);
            if (value == null) return null;

            return MapEntry(
              parameter.name,
              value,
            );
          },
        ).whereType<MapEntry<String, Expression>>(),
      ),
    );
  }

  static Expression? _getValue({required WidgetConfig child, required WidgetParameter parameter}) {
    final field = child.fields[parameter.name];
    if (field?.ignore == true && parameter.defaultValue == null && field?.overridenDefaultValue == null) return null;

    final isCustom = parameter.type.type == DataTypeEnum.custom;
    final canGenerateCustom = child.widgetConfigs[parameter.name] != null;
    final ignoreField = field?.ignore == true;
    final hasOverride = field?.overridenDefaultValue != null;

    final Expression value;
    if (isCustom && canGenerateCustom && !hasOverride && !ignoreField) {
      value = buildWidgetFromConf(child.widgetConfigs[parameter.name]!);
    } else if ((((isCustom && !canGenerateCustom) && !hasOverride) || ignoreField)) {
      value = Reference(parameter.defaultValue ?? field?.overridenDefaultValue ?? parameter.type.defaultValue);
    } else {
      value = Reference(child.getVariableName(parameter));
    }
    return value;
  }
}
