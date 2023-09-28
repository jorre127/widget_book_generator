import 'package:code_builder/code_builder.dart';

class WidgetBuilder {
  static const centerName = 'Center';

  static Expression buildCenter({Expression? child}) => const Reference(centerName).constInstance(
        [],
        {
          'child': child ?? const Reference('SizedBox.shrink()'),
        },
      );
}
