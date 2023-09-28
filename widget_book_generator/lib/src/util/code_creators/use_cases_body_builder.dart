import 'package:code_builder/code_builder.dart';
import 'package:widget_book_generator/src/models/widget_config.dart';
import 'package:widget_book_generator/src/util/case_util.dart';
import 'package:widget_book_generator/src/util/extensions/spec_extension.dart';
import 'package:widget_book_generator/src/util/widget_builder/widget_builder.dart';

class UseCasesBodyBuilder {
  static const _useCasesDefaultName = 'UseCases';

  UseCasesBodyBuilder._();

  static Spec createUseCasesBody(List<WidgetConfig> configs) => Class(
        (classBuilder) => classBuilder
          ..name = _useCasesDefaultName
          ..methods.addAll(
            configs.map(
              (config) => Method(
                (methodBuilder) => methodBuilder
                  ..lambda = true
                  ..name = CaseUtil('${config.name}UseCase').camelCase
                  ..returns = const Reference(WidgetBuilder.centerName)
                  ..annotations.add(
                    const Reference('UseCase').call([], {
                      'name': literalString(config.name),
                      'type': Reference(config.name),
                    }),
                  )
                  ..body = Code(WidgetBuilder.buildCenter().toDart()),
              ),
            ),
          ),
      );
}
