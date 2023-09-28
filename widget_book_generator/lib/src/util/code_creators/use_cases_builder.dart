import 'package:code_builder/code_builder.dart';
import 'package:widget_book_generator/src/models/widget_config.dart';
import 'package:widget_book_generator/src/util/code_creators/use_cases_body_builder.dart';
import 'package:widget_book_generator/src/util/code_creators/use_cases_imports_builder.dart';

class UseCasesBuilder {
  UseCasesBuilder._();

  static Library createUseCasesContent(List<WidgetConfig> configs) => Library(
        (libraryBuilder) => libraryBuilder
          ..directives.addAll(UseCasesImportBuilder.createImports())
          ..body.add(UseCasesBodyBuilder.createUseCasesBody(configs)),
      );
}
