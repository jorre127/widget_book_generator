import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_book_generator/src/generators/widget_book_widget_generator.dart';

Builder widgetBookWidgetBuilder(BuilderOptions options) {
  return LibraryBuilder(
    WidgetBookWidgetGenerator(),
    generatedExtension: '.json',
  );
}
