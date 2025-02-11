import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/util/case_util.dart';
import 'package:widget_book_widget_generator/src/util/code_creators/use_case_variable_builder.dart';
import 'package:widget_book_widget_generator/src/util/extensions/spec_extension.dart';
import 'package:widget_book_widget_generator/src/util/widget_builder/use_case_widget_builder.dart';

class UseCasesBodyBuilder {
  UseCasesBodyBuilder._();

  static List<Spec> createUseCasesBody(List<WidgetConfig> configs) => configs.map(
        (config) {
          final useCaseName = [
            config.name,
            if (config.constructorName.isNotEmpty) '(${config.constructorName})',
          ].join(' ');
          return Method(
            (methodBuilder) => methodBuilder
              ..name = CaseUtil('${config.name}UseCase ${config.constructorName}').camelCase
              ..returns = Reference('Widget')
              ..requiredParameters.add(Parameter(
                (parameterBuilder) => parameterBuilder
                  ..named = false
                  ..name = 'context'
                  ..type = const Reference('BuildContext'),
              ))
              ..annotations.add(
                const Reference('UseCase').call([], {
                  'name': literalString(useCaseName),
                  'type': Reference(config.name),
                }),
              )
              ..body = Block(
                (builder) {
                  builder.statements.addAll(UseCaseVariableBuilder.createUseCaseVariables(config).map((variable) => Code(variable.toDart())));
                  builder.addExpression(Reference(WidgetBuilder.buildWidget(
                    name: 'Center',
                    child: WidgetBuilder.buildWidgetFromConf(config),
                  ).toDart())
                      .returned);
                },
              ),
          );
        },
      ).toList();
}
