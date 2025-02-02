import 'package:widget_book_widget_generator/src/models/widget_field.dart';
import 'package:widget_book_widget_generator/src/models/widget_parameter.dart';

class WidgetConfig {
  final String name;
  final String? import;
  final List<WidgetParameter> parameters;
  final Map<String, WidgetField> fields;
  final Map<String, WidgetConfig> widgetConfigs;

  const WidgetConfig({
    required this.widgetConfigs,
    required this.import,
    required this.parameters,
    required this.name,
    required this.fields,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'import': import,
        'parameters': parameters.map((parameter) => parameter.toMap()).toList(),
        'fields': fields.map((key, value) => MapEntry(key, value.toMap())),
        'widgetConfigs': widgetConfigs.map((key, value) => MapEntry(key, value.toMap())),
      };

  factory WidgetConfig.fromMap(Map<String, dynamic> map) => WidgetConfig(
        parameters: (map['parameters'] as List).map((parameter) => WidgetParameter.fromMap(parameter)).toList(),
        name: map['name'],
        import: map['import'],
        fields: (map['fields'] as Map).map((key, value) => MapEntry(key, WidgetField.fromMap(value))),
        widgetConfigs: (map['widgetConfigs'] as Map).map((key, value) => MapEntry(key, WidgetConfig.fromMap(value))),
      );
}
