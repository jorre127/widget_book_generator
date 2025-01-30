import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';

class WidgetBuilder {
  static Expression buildWidget({required String name, required Expression child, String? childParameterName}) =>
      Reference(name).constInstance([], {'${childParameterName ?? 'child'}': child});

  static Expression buildWidgetFromConf(WidgetConfig child) {
    return Reference(child.name).constInstance(
      [],
      Map.fromEntries(
          child.parameters.where((parameter) => parameter.isNamed).map((parameter) => MapEntry(parameter.name, Reference(parameter.defaultValue ?? parameter.type.defaultValue)))),
    );
  }
}
