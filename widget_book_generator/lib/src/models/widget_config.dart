import 'package:widget_book_generator/src/models/parameter.dart';

class WidgetConfig {
  final String name;
  final String? import;
  final List<Parameter> parameters;

  const WidgetConfig({
    required this.import,
    required this.parameters,
    required this.name,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'import': import,
        'parameters': parameters.map((parameter) => parameter.toMap()).toList(),
      };

  factory WidgetConfig.fromMap(Map<String, dynamic> map) => WidgetConfig(
        parameters: (map['parameters'] as List).map((parameter) => Parameter.fromMap(parameter)).toList(),
        name: map['name'],
        import: map['import'],
      );
}
