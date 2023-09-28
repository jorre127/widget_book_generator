import 'dart:convert';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:glob/glob.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_book_generator/src/models/widget_config.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

class WidgetBookWidgetGenerator extends GeneratorForAnnotation<App> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) async {
    final configGlob = Glob("**.widgetconfig.json");
    final configFileIds = buildStep.findAssets(configGlob);
    final widgetConfigs = <WidgetConfig>[];

    await for (final fileId in configFileIds) {
      final dynamic json = jsonDecode(await buildStep.readAsString(fileId));
      final parsedConfigs = (json as List).map((jsonItem) => WidgetConfig.fromMap(jsonItem)).toList();
      widgetConfigs.addAll(parsedConfigs);
    }

    final library = Library((libraryBuilder) => libraryBuilder
      ..body.addAll(
        widgetConfigs
            .map(
              (widget) => Class((classBuilder) => classBuilder..name = widget.name),
            )
            .toList(),
      ));

    final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      orderDirectives: true,
      useNullSafetySyntax: true,
    );
    print('HERE');

    return DartFormatter().format(library.accept(emitter).toString());
  }
}
