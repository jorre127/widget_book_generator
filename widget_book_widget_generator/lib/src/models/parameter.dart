import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:widget_book_widget_generator/src/models/data_type.dart';

class WidgetParameter {
  final bool isRequired;
  final bool isNullable;
  final bool isNamed;
  final DataType type;
  final String name;
  final String? defaultValue;

  WidgetParameter({
    required this.name,
    required this.isRequired,
    required this.isNullable,
    required this.defaultValue,
    required this.isNamed,
    required this.type,
  });

  WidgetParameter.fromParameterElement(ParameterElement element)
      : name = element.name,
        isRequired = element.isRequired,
        isNullable = element.type.nullabilitySuffix == NullabilitySuffix.question,
        defaultValue = element.defaultValueCode,
        isNamed = element.isNamed,
        type = DataType.fromDartType(
          type: element.type.getDisplayString(withNullability: true),
          hasParameters: element.parameters.isNotEmpty,
        );

  Map<String, dynamic> toMap() => {
        'name': name,
        'isRequired': isRequired,
        'isNullable': isNullable,
        'defaultValue': defaultValue,
        'isNamed': isNamed,
        'type': type.toMap(),
      };

  factory WidgetParameter.fromMap(Map<String, dynamic> map) => WidgetParameter(
        name: map['name'],
        isRequired: map['isRequired'],
        isNullable: map['isNullable'],
        defaultValue: map['defaultValue'],
        isNamed: map['isNamed'],
        type: DataType.fromMap(map['type']),
      );
}
