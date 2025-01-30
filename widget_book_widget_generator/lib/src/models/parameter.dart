import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';

class Parameter {
  final bool isRequired;
  final bool isNullable;
  final String name;
  final String? defaultValue;

  Parameter({
    required this.name,
    required this.isRequired,
    required this.isNullable,
    required this.defaultValue,
  });

  Parameter.fromParameterElement(ParameterElement element)
      : name = element.name,
        isRequired = element.isRequired,
        isNullable = element.type.nullabilitySuffix == NullabilitySuffix.question,
        defaultValue = element.defaultValueCode;

  Map<String, dynamic> toMap() => {
        'name': name,
        'isRequired': isRequired,
        'isNullable': isNullable,
        'defaultValue': defaultValue,
      };

  factory Parameter.fromMap(Map<String, dynamic> map) => Parameter(
        name: map['name'],
        isRequired: map['isRequired'],
        isNullable: map['isNullable'],
        defaultValue: map['defaultValue'],
      );
}
