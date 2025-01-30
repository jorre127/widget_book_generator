import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:widget_book_widget_generator/src/models/parameter.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/type_checkers.dart';
import 'package:widget_book_widget_generator/src/util/import_resolver.dart';

class WidgetConfigCreator {
  final ImportResolver _importResolver;

  WidgetConfigCreator(List<LibraryElement> libs) : _importResolver = ImportResolver(libs);

  List<WidgetConfig> create(ClassElement widget) {
    final annotations = widgetBookWidgetTypeChecker.annotationsOf(widget, throwOnUnresolved: false);
    return annotations.map((annotation) => _createWidgetConfig(widget, annotation)).toList();
  }

  WidgetConfig _createWidgetConfig(
    ClassElement widget,
    DartObject annotation,
  ) {
    final constructor = widget.constructors.first;
    final parameters = constructor.parameters.map(Parameter.fromParameterElement).toList();
    final name = widget.name;

    return WidgetConfig(
      parameters: parameters,
      name: name,
      import: _importResolver.resolveImport(widget),
    );
  }
}
