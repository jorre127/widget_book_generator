class WidgetBookWidgetField {
  final String? defaultValue;
  /// If ignore is set to true, then no default value (using knobs) will be generated for this field
  final bool ignore;

  const WidgetBookWidgetField({
    this.defaultValue,
    this.ignore = false,
  });
}
