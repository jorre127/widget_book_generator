import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:widget_book_generator/src/generators/widget_book_widget_config_generator.dart';
import 'package:widget_book_generator/src/generators/widget_book_widget_generator.dart';

Builder widgetBookWidgetConfigBuilder(BuilderOptions options) {
  return LibraryBuilder(
    WidgetBookWidgetConfigGenerator(),
    formatOutput: (generated) => generated.replaceAll(RegExp(r'//.*|\s'), ''),
    generatedExtension: '.widgetconfig.json',
  );
}

Builder widgetBookWidgetBuilder(BuilderOptions options) {
  return LibraryBuilder(
    WidgetBookWidgetGenerator(),
    generatedExtension: '.usecases.dart',
  );
}
