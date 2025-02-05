import 'package:analyzer/dart/element/element.dart';
import 'package:widget_book_widget_generator/src/models/data_type.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/models/widget_field.dart';
import 'package:widget_book_widget_generator/src/models/widget_parameter.dart';
import 'package:widget_book_widget_generator/src/type_checkers.dart';
import 'package:widget_book_widget_generator/src/util/import_resolver.dart';

class WidgetConfigCreator {
  final ImportResolver _importResolver;

  WidgetConfigCreator(List<LibraryElement> libs) : _importResolver = ImportResolver(libs);

  List<WidgetConfig> create(ClassElement widget) {
    final annotations = widgetBookWidgetTypeChecker.annotationsOf(widget, throwOnUnresolved: false);
    return annotations.map((annotation) => _createWidgetConfig(widget: widget)).toList();
  }

  WidgetConfig _createWidgetConfig({
    required ClassElement widget,
    String? path,
  }) {
    final hasParent = path != null;
    final constructor = widget.constructors.first;
    final parameters = constructor.parameters.map((parameter) => WidgetParameter.fromParameterElement(element: parameter, importResolver: _importResolver)).toList();
    final fields = Map.fromEntries(widget.fields.map((field) => MapEntry(field.name, WidgetField.fromFieldElement(field))));
    final widgetConfigs = Map.fromEntries(
      parameters.where((parameter) => parameter.type.type == DataTypeEnum.custom && parameter.element is ClassElement && fields[parameter.name]?.ignore != true).map(
            (parameter) => MapEntry(
              parameter.name,
              _createWidgetConfig(
                widget: parameter.element as ClassElement,
                path: [
                  if (hasParent) path,
                  parameter.name,
                ].join('/'),
              ),
            ),
          ),
    );

    final name = widget.name;

    return WidgetConfig(
      parameters: parameters,
      fields: fields,
      widgetConfigs: widgetConfigs,
      name: name,
      import: _importResolver.resolveImport(widget),
      path: path,
    );
  }
}
