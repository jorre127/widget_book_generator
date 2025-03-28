// ignore_for_file: deprecated_member_use

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/nullability_suffix.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:widget_book_widget_generator/src/util/import_resolver.dart';

class DataType {
  final String name;
  final String defaultValue;
  final DataTypeEnum? type;
  final String typeString;
  final String? import;
  final bool isEnum;
  final bool isFunction;
  final bool isNullable;
  final List<String>? enumValues;

  DataType({
    required this.name,
    required this.isEnum,
    required this.defaultValue,
    required this.type,
    required this.typeString,
    required this.isNullable,
    this.import,
    this.enumValues,
    this.isFunction = false,
  });

  factory DataType.fromDartType({
    required DartType type,
    required String name,
    required ImportResolver importResolver,
    DartType? genericType,
  }) {
    var typeString = type.getDisplayString(withNullability: true);
    if (typeString == 'T' || typeString == 'T?') typeString = genericType?.getDisplayString(withNullability: true) ?? 'dynamic';

    final isNullable = type.nullabilitySuffix == NullabilitySuffix.question;
    bool isFunction = false;
    String? import;
    List<String> enumValues = [];

    if (type is FunctionType) {
      isFunction = true;
    }

    final isList = type.isDartCoreList;
    final element = type.element;

    if (element is EnumElement) {
      enumValues = element.fields.where((field) => field.isEnumConstant).map((field) => field.name).toList();
      import = importResolver.resolveImport(element);
    }

    final dataType = switch (typeString) {
      'string' || 'String' || 'string?' || 'String?' => DataType(
          name: 'String',
          isEnum: false,
          isNullable: isNullable,
          defaultValue: "'{$name}'",
          type: DataTypeEnum.string,
          typeString: typeString,
        ),
      'int' || 'int?' => DataType(
          name: 'int',
          isEnum: false,
          isNullable: isNullable,
          defaultValue: '0',
          type: DataTypeEnum.int,
          typeString: typeString,
        ),
      'double' || 'double?' => DataType(
          name: 'double',
          isEnum: false,
          isNullable: isNullable,
          defaultValue: '0.0',
          type: DataTypeEnum.double,
          typeString: typeString,
        ),
      'bool' || 'bool?' => DataType(
          name: 'bool',
          isEnum: false,
          isNullable: isNullable,
          defaultValue: 'true',
          type: DataTypeEnum.bool,
          typeString: typeString,
        ),
      'Color' || 'Color?' => DataType(
          name: 'Color',
          isEnum: false,
          isNullable: isNullable,
          defaultValue: 'Colors.blue',
          type: DataTypeEnum.color,
          typeString: typeString,
        ),
      'DateTime' || 'DateTime?' => DataType(
          name: 'DateTime',
          isEnum: false,
          isNullable: isNullable,
          defaultValue: 'DateTime.now()',
          type: DataTypeEnum.date,
          typeString: typeString,
        ),
      'Key' || 'Key?' => DataType(
          name: 'Key',
          isEnum: false,
          isNullable: isNullable,
          defaultValue: 'null',
          type: DataTypeEnum.key,
          typeString: typeString,
        ),
      'Widget' || 'Widget?' => DataType(
          name: 'Widget',
          isEnum: false,
          isNullable: isNullable,
          defaultValue: 'SizedBox.shrink()',
          type: DataTypeEnum.widget,
          typeString: typeString,
        ),
      _ when enumValues.isNotEmpty => DataType(
          name: typeString,
          isEnum: true,
          isNullable: isNullable,
          defaultValue: '${typeString.replaceAll('?', '')}.${enumValues.first}',
          type: DataTypeEnum.enumType,
          import: import,
          enumValues: enumValues,
          typeString: typeString),
      _ when isFunction => DataType(
          name: typeString,
          isEnum: false,
          isNullable: isNullable,
          defaultValue: _getDefaultValueFunction(type as FunctionType),
          type: DataTypeEnum.function,
          typeString: typeString),
      _ when isList => DataType(
          name: typeString,
          isEnum: false,
          isNullable: isNullable,
          defaultValue: 'const []',
          type: DataTypeEnum.list,
          typeString: typeString,
        ),
      _ => DataType(
          name: typeString,
          isEnum: false,
          isNullable: isNullable,
          defaultValue: 'null',
          type: DataTypeEnum.custom,
          typeString: typeString,
        ),
    };

    if (dataType.type == DataTypeEnum.custom) {
      print('Custom type $type of variable $name not recognized, default value is null');
    }

    return dataType;
  }

  static String _getDefaultValueFunction(FunctionType type) {
    final parameters = type.parameters.map((e) => '${e.type.getDisplayString(withNullability: true)} ${e.name}').join(', ');
    return '($parameters)${type.returnType.isDartAsyncFuture ? ' async' : ''} {}';
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'isEnum': isEnum,
        'defaultValue': defaultValue,
        'type': type?.index,
        'enumValues': enumValues,
        'typeString': typeString,
        'isNullable': isNullable,
        'import': import,
      };

  factory DataType.fromMap(Map<String, dynamic> map) => DataType(
        name: map['name'],
        isEnum: map['isEnum'],
        defaultValue: map['defaultValue'],
        type: DataTypeEnum.values[map['type']],
        enumValues: (map['enumValues'] as List<dynamic>?)?.map((e) => e as String).toList(),
        typeString: map['typeString'],
        isNullable: map['isNullable'],
        import: map['import'],
      );
}

enum DataTypeEnum {
  string,
  int,
  key,
  list,
  double,
  bool,
  date,
  color,
  enumType,
  function,
  widget,
  custom,
}
