// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:example/widgetbook/widgetbook.usecases.dart' as _i2;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widget',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'Button',
        useCase: _i1.WidgetbookUseCase(
          name: 'Button',
          builder: _i2.buttonUseCase,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'Test',
        useCase: _i1.WidgetbookUseCase(
          name: 'Test',
          builder: _i2.testUseCase,
        ),
      ),
    ],
  )
];
