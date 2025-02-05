import 'package:widget_book_widget_generator/src/models/data_type.dart';
import 'package:widget_book_widget_generator/src/models/widget_field.dart';
import 'package:widget_book_widget_generator/src/models/widget_parameter.dart';

class WidgetConfig {
  final String name;
  final String? import;
  final String? path;
  final List<WidgetParameter> parameters;
  final Map<String, WidgetField> fields;
  final Map<String, WidgetConfig> widgetConfigs;

  const WidgetConfig({
    required this.widgetConfigs,
    required this.import,
    required this.parameters,
    required this.name,
    required this.fields,
    required this.path,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'import': import,
        'parameters': parameters.map((parameter) => parameter.toMap()).toList(),
        'fields': fields.map((key, value) => MapEntry(key, value.toMap())),
        'widgetConfigs': widgetConfigs.map((key, value) => MapEntry(key, value.toMap())),
        'path': path,
      };

  factory WidgetConfig.fromMap(Map<String, dynamic> map) => WidgetConfig(
        parameters: (map['parameters'] as List).map((parameter) => WidgetParameter.fromMap(parameter)).toList(),
        name: map['name'],
        import: map['import'],
        fields: (map['fields'] as Map).map((key, value) => MapEntry(key, WidgetField.fromMap(value))),
        widgetConfigs: (map['widgetConfigs'] as Map).map((key, value) => MapEntry(key, WidgetConfig.fromMap(value))),
        path: map['path'],
      );

  bool shouldNotGenerateVariableForParameter(WidgetParameter parameter) {
    final field = fields[parameter.name];
    return field == null || field.ignore || (parameter.type.type == DataTypeEnum.custom && field.overridenDefaultValue == null);
  }
}
