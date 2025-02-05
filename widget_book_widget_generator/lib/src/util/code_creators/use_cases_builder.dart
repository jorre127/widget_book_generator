import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/util/code_creators/use_cases_body_builder.dart';
import 'package:widget_book_widget_generator/src/util/code_creators/use_cases_imports_builder.dart';

class UseCasesBuilder {
  UseCasesBuilder._();

  static Library createUseCasesContent(List<WidgetConfig> configs) {
    final comments = [
      'ignore_for_file: prefer_function_declarations_over_variables',
      'prefer_final_locals',
      'omit_local_variable_types',
      'prefer_int_literals',
      'avoid_types_on_closure_parameters',
      'avoid_positional_boolean_parameters',
      'prefer_const_constructors',
      'avoid_init_to_null',
      'unnecessary_import',
      'prefer_collection_literals',
    ];
    return Library(
      (libraryBuilder) => libraryBuilder
        ..comments.add(comments.join(', '))
        ..directives.addAll(UseCasesImportBuilder.createImports(configs))
        ..body.addAll(UseCasesBodyBuilder.createUseCasesBody(configs)),
    );
  }
}
