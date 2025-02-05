import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/util/widget_config_extension.dart';

class UseCasesImportBuilder {
  UseCasesImportBuilder._();

  static List<Directive> createImports(List<WidgetConfig> configs) {
    final customImports = configs.map((config) => config.allWidgetConfigs).expand((config) => config).map((config)=> config.import);
    final imports = [
      'package:flutter/material.dart',
      'package:widgetbook/widgetbook.dart',
      'package:widgetbook_annotation/widgetbook_annotation.dart',
      ...customImports.toSet(),
    ].whereType<String>();

    return imports.map(Directive.import).toList();
  }
}
