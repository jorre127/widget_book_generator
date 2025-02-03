import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_book_widget_generator/src/type_checkers.dart';

class WidgetField {
  final String? overridenDefaultValue;
  final bool ignore;

  const WidgetField({
    required this.overridenDefaultValue,
    this.ignore = false,
  });

  factory WidgetField.fromFieldElement(FieldElement field) {
    final annotation = ConstantReader(widgetBookWidgetFieldTypeChecker.firstAnnotationOf(field, throwOnUnresolved: false));
    final overridenDefaultValue = annotation.peek('defaultValue')?.stringValue;
    final ignore = annotation.peek('ignore')?.boolValue;

    return WidgetField(
      overridenDefaultValue: overridenDefaultValue,
      ignore: ignore ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
        'overrideDefault': overridenDefaultValue,
        'ignore': ignore,
      };

  factory WidgetField.fromMap(Map<String, dynamic> map) => WidgetField(
        overridenDefaultValue: map['overrideDefault'],
        ignore: map['ignore'],
      );
}
