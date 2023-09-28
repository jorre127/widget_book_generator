import 'dart:async';

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_book_generator_annotations/widget_book_generator_annotations.dart';

const TypeChecker _typeChecker = TypeChecker.fromRuntime(WidgetBookWidget);

class WidgetBookWidgetGenerator implements Generator {
  @override
  Future<String?> generate(LibraryReader library, BuildStep buildStep) async {
    final classes = library.classes.where(_typeChecker.hasAnnotationOf);
    final string = StringBuffer();
    for (var element in classes) {
      string.write(element.name);
    }
    return string.toString();
  }
}
