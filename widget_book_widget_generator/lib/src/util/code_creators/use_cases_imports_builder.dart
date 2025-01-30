import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';

class UseCasesImportBuilder {
  UseCasesImportBuilder._();

  static List<Directive> createImports(List<WidgetConfig> configs) {
    final imports = [
      'package:flutter/material.dart',
      'package:widgetbook_annotation/widgetbook_annotation.dart',
      ...configs.map((config) => config.import).toList(),
    ].whereType<String>();

    return imports.map(Directive.import).toList();
  }
}
