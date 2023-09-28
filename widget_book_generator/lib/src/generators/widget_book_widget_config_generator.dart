import 'dart:async';
import 'dart:convert';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_book_generator/src/type_checkers.dart';
import 'package:widget_book_generator/src/util/widget_config_creator.dart';

class WidgetBookWidgetConfigGenerator implements Generator {
  @override
  Future<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final configs = library.classes.where(widgetBookWidgetTypeChecker.hasAnnotationOf).map(WidgetConfigCreator.create).expand((element) => element).toList();
    return configs.isEmpty ? null : jsonEncode(configs.map((config) => config.toMap()).toList());
  }
}
