import 'package:widget_book_widget_generator/src/models/widget_config.dart';

extension WidgetConfigExtension on WidgetConfig {
  List<WidgetConfig> get allWidgetConfigs {
    return [
      this,
      ...widgetConfigs.values.expand((child) => child.allWidgetConfigs),
    ];
  }
}
