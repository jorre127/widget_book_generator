import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/data_type.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/util/case_util.dart';

class WidgetBuilder {
  static Expression buildWidget({required String name, required Expression child, String? childParameterName}) =>
      Reference(name).newInstance([], {'${childParameterName ?? 'child'}': child});

  static Expression buildWidgetFromConf(WidgetConfig child) {
    return Reference(child.name).newInstance(
      [],
      Map.fromEntries(
        child.parameters.where((parameter) => parameter.isNamed && parameter.type.type != DataTypeEnum.key).map(
          (parameter) {
            final field = child.fields[parameter.name];
            if (field?.ignore == true && parameter.defaultValue == null && field?.overridenDefaultValue == null) return null;
            
            if (parameter.type.type == DataTypeEnum.custom && child.widgetConfigs[parameter.name] != null && field?.ignore != true) {
              return MapEntry(
                parameter.name,
                buildWidgetFromConf(child.widgetConfigs[parameter.name]!),
              );
            } else if ((parameter.type.type == DataTypeEnum.custom && child.widgetConfigs[parameter.name] == null) || field?.ignore == true) {
              return MapEntry(
                parameter.name,
                Reference(parameter.defaultValue ?? 'null'),
              );
            } else {
              return MapEntry(
                parameter.name,
                Reference(CaseUtil('${child.name} ${parameter.name} ${parameter.id}').camelCase),
              );
            }
          },
        ).whereType<MapEntry<String, Expression>>(),
      ),
    );
  }
}
