

This is a helper package for more easily generating usecases for your widgets using widgetbook

## Usage

All you have to do to generate the usecases is to add the the @WidgetBookWidget annotation to a widget like this:

```dart
@widgetBookWidget
class TestProgressIndicator extends StatelessWidget {
  final bool dark;
```

You can further specify some extra configuration by adding the @WidgetBookWidgetField annotation to the field of a widget like this:
```dart
@widgetBookWidget
class TestProgressIndicator extends StatelessWidget {
  @WidgetBookWidgetField(defaultValue: false)
  final bool dark;
```
The default value option will give the widget the value that is specified there (no custom knob will be generated).

```dart
@widgetBookWidget
class TestProgressIndicator extends StatelessWidget {
  @WidgetBookWidgetField(ignore: true)
  final bool dark;
```

The ignore statement will also not generate a knob, but will instead just give the default value, if there is none it will just not pass anything for that parameter, so the parameter will have to be optional otherwise you will get an error.

```dart
@widgetBookWidget
class TestProgressIndicator extends StatelessWidget {
  @WidgetBookWidgetField(options: [true, false])
  final bool dark;
```

The options parameters allows you to pass your own custom list of options (basic types like int, bool, string etc.). This is usefull for example when one of the parameters is the url to an asset, you can then give a set list of assets urls you want to use for testing. The first value of the list will be used as the default.