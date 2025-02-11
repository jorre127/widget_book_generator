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
        name: 'FlutterTemplateInputField',
        useCase: _i1.WidgetbookUseCase(
          name: 'FlutterTemplateInputField',
          builder: _i2.flutterTemplateInputFieldUseCase,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'TestBackButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'TestBackButton',
            builder: _i2.testBackButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'TestBackButton (dark)',
            builder: _i2.testBackButtonUseCaseDark,
          ),
          _i1.WidgetbookUseCase(
            name: 'TestBackButton (light)',
            builder: _i2.testBackButtonUseCaseLight,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'TestButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'TestButton',
            builder: _i2.testButtonUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'TestButton (text)',
            builder: _i2.testButtonUseCaseText,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'TestCheckBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'TestCheckBox',
          builder: _i2.testCheckBoxUseCase,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'TestProgressIndicator',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'TestProgressIndicator',
            builder: _i2.testProgressIndicatorUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'TestProgressIndicator (dark)',
            builder: _i2.testProgressIndicatorUseCaseDark,
          ),
          _i1.WidgetbookUseCase(
            name: 'TestProgressIndicator (light)',
            builder: _i2.testProgressIndicatorUseCaseLight,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'TestSwitch',
        useCase: _i1.WidgetbookUseCase(
          name: 'TestSwitch',
          builder: _i2.testSwitchUseCase,
        ),
      ),
    ],
  )
];
