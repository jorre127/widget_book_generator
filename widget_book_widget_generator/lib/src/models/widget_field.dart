import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_book_widget_generator/src/type_checkers.dart';

class WidgetField {
  final String? overridenDefaultValue;

  const WidgetField({
    required this.overridenDefaultValue,
  });

  factory WidgetField.fromFieldElement(FieldElement field) {
    final annotation = ConstantReader(widgetBookWidgetFieldTypeChecker.firstAnnotationOf(field, throwOnUnresolved: false));
    final overridenDefaultValue = annotation.peek('defaultValue')?.stringValue;

    return WidgetField(overridenDefaultValue: overridenDefaultValue);
  }

  Map<String, dynamic> toMap() => {
        'overrideDefault': overridenDefaultValue,
      };

  factory WidgetField.fromMap(Map<String, dynamic> map) => WidgetField(
        overridenDefaultValue: map['overrideDefault'],
      );
}
