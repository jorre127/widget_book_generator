import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:widget_book_generator/src/models/parameter.dart';
import 'package:widget_book_generator/src/models/widget_config.dart';
import 'package:widget_book_generator/src/type_checkers.dart';

class WidgetConfigCreator {
  WidgetConfigCreator._();

  static List<WidgetConfig> create(ClassElement widget) {
    final annotations = widgetBookWidgetTypeChecker.annotationsOf(widget, throwOnUnresolved: false);
    return annotations.map((annotation) => _createWidgetConfig(widget, annotation)).toList();
  }

  static WidgetConfig _createWidgetConfig(
    ClassElement widget,
    DartObject annotation,
  ) {
    final constructor = widget.constructors.first;
    final parameters = constructor.parameters.map(Parameter.fromParameterElement).toList();
    final name = widget.name;

    return WidgetConfig(
      parameters: parameters,
      name: name,
    );
  }
}
