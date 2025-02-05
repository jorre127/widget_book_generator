import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/data_type.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';

class WidgetBuilder {
  static Expression buildWidget({required String name, required Expression child, String? childParameterName}) =>
      Reference(name).newInstance([], {'${childParameterName ?? 'child'}': child});

  static Expression buildWidgetFromConf(WidgetConfig child) {
    final parameters = child.parameters.where((parameter) => parameter.isNamed && parameter.type.type != DataTypeEnum.key);
    return Reference(child.name).newInstance(
      [],
      Map.fromEntries(
        parameters.map(
          (parameter) {
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

            return MapEntry(
              parameter.name,
              value,
            );
          },
        ).whereType<MapEntry<String, Expression>>(),
      ),
    );
  }
}
