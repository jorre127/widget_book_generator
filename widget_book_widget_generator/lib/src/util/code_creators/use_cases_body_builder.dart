import 'package:code_builder/code_builder.dart';
import 'package:widget_book_widget_generator/src/models/widget_config.dart';
import 'package:widget_book_widget_generator/src/util/case_util.dart';
import 'package:widget_book_widget_generator/src/util/extensions/spec_extension.dart';
import 'package:widget_book_widget_generator/src/util/widget_builder/widget_builder.dart';

class UseCasesBodyBuilder {
  UseCasesBodyBuilder._();

  static List<Spec> createUseCasesBody(List<WidgetConfig> configs) => configs
      .map(
        (config) => Method(
          (methodBuilder) => methodBuilder
            ..lambda = true
            ..name = CaseUtil('${config.name}UseCase').camelCase
            ..returns = Reference('Widget')
            ..requiredParameters.add(Parameter(
              (parameterBuilder) => parameterBuilder
                ..named = false
                ..name = 'context'
                ..type = const Reference('BuildContext'),
            ))
            ..annotations.add(
              const Reference('UseCase').call([], {
                'name': literalString(config.name),
                'type': Reference(config.name),
              }),
            )
            ..body = Code(
              WidgetBuilder.buildWidget(
                name: 'Scaffold',
                childParameterName: 'body',
                child: WidgetBuilder.buildWidget(
                  name: 'Center',
                  child: WidgetBuilder.buildWidgetFromConf(config),
                ),
              ).toDart(),
            ),
        ),
      )
      .toList();
}
