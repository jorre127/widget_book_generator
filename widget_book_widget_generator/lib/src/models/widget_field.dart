import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_book_widget_generator/src/type_checkers.dart';

class WidgetField {
  final dynamic overridenDefaultValue;
  final bool ignore;
  final List<String>? options;

  const WidgetField({
    required this.overridenDefaultValue,
    this.ignore = false,
    this.options = const [],
  });

  factory WidgetField.fromFieldElement(FieldElement field) {
    final annotation = ConstantReader(widgetBookWidgetFieldTypeChecker.firstAnnotationOf(field, throwOnUnresolved: false));
    final overridenDefaultValue = _dartObjectToValue(annotation.peek('defaultValue')?.objectValue);
    final ignore = annotation.peek('ignore')?.boolValue;
    final options = annotation.peek('options')?.listValue.map((option) => _dartObjectToValue(option));

    return WidgetField(
      overridenDefaultValue: overridenDefaultValue,
      ignore: ignore ?? false,
      options: options?.map((option) => option.toString()).toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'overrideDefault': overridenDefaultValue,
        'ignore': ignore,
        'options': options,
      };

  factory WidgetField.fromMap(Map<String, dynamic> map) => WidgetField(
        overridenDefaultValue: map['overrideDefault'],
        ignore: map['ignore'],
        options: (map['options'] as List?)?.map((option) => option as String).toList(),
      );

  static dynamic _dartObjectToValue(DartObject? dartObject) {
    if (dartObject == null || dartObject.isNull) return null;
    final boolValue = dartObject.toBoolValue();
    if (boolValue != null) return boolValue;

    final intValue = dartObject.toIntValue();
    if (intValue != null) return intValue;

    final doubleValue = dartObject.toDoubleValue();
    if (doubleValue != null) return doubleValue;

    final stringValue = dartObject.toStringValue();
    if (stringValue != null) return "'$stringValue'";
    return dartObject;
  }
}
