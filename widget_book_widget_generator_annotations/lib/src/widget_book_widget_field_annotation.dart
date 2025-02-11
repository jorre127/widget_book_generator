class WidgetBookWidgetField {
  final String? defaultValue;
  /// If ignore is set to true, then no default value (using knobs) will be generated for this field
  final bool ignore;
  /// If options is set, then the field will be treated as a list of options and the list knob will be used
  final List<dynamic> options;

  const WidgetBookWidgetField({
    this.defaultValue,
    this.ignore = false,
    this.options = const [],
  });
}
