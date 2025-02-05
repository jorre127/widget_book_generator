import 'package:widget_book_widget_generator/src/models/widget_config.dart';

extension WidgetConfigExtension on WidgetConfig {
  List<WidgetConfig> get allWidgetConfigs {
    final allConfigs =
        widgetConfigs.values.expand((element) => [element, ...element.widgetConfigs.entries.map((config) => config.value.allWidgetConfigs).expand((config) => config)]);

    return [this, ...allConfigs];
  }
}
