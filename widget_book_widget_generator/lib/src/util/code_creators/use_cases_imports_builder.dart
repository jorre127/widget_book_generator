import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/util/widget_config_extension.dart';

class UseCasesImportBuilder {
  UseCasesImportBuilder._();

  static List<Directive> createImports(List<WidgetConfig> configs) {
    final allConfigs = configs.map((config) => config.allWidgetConfigs).expand((config) => config);
    final extraImports = allConfigs.map((config) => config.parameters.map((parameter) => parameter.type.import)).expand((config) => config).whereType<String>();
    final classImports = allConfigs.map((config) => config.import);
    final imports = [
      'package:flutter/material.dart',
      'package:widgetbook/widgetbook.dart',
      'package:widgetbook_annotation/widgetbook_annotation.dart',
      ...extraImports,
      ...classImports,
    ].whereType<String>().toSet();

    return imports.map(Directive.import).toList();
  }
}
