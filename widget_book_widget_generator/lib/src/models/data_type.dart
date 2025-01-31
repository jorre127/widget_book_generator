import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

class DataType {
  final String name;
  final String defaultValue;
  final DataTypeEnum? type;
  final String typeString;
  final bool isEnum;
  final bool isFunction;
  final List<String>? enumValues;

  DataType({
    required this.name,
    required this.isEnum,
    required this.defaultValue,
    required this.type,
    required this.typeString,
    this.enumValues,
    this.isFunction = false,
  });

  factory DataType.fromDartType({required DartType type}) {
    final typeString = type.getDisplayString(withNullability: true);
    bool isFunction = false;
    List<String> enumValues = [];

    if (type is FunctionType) {
      isFunction = true;
    }

    final isList = type.isDartCoreList;
    final element = type.element;

    if (element is EnumElement) {
      enumValues = element.fields.where((field) => field.name != 'values').map((field) => field.name).toList();
    }

    final dataType = switch (typeString) {
      'string' ||
      'String' ||
      'string?' ||
      'String?' =>
        DataType(name: 'String', isEnum: false, defaultValue: "''", type: DataTypeEnum.string, typeString: type.getDisplayString(withNullability: true)),
      'int' || 'int?' => DataType(name: 'int', isEnum: false, defaultValue: '0', type: DataTypeEnum.int, typeString: type.getDisplayString(withNullability: true)),
      'double' || 'double?' => DataType(name: 'double', isEnum: false, defaultValue: '0.0', type: DataTypeEnum.double, typeString: type.getDisplayString(withNullability: true)),
      'bool' || 'bool?' => DataType(name: 'bool', isEnum: false, defaultValue: 'true', type: DataTypeEnum.bool, typeString: type.getDisplayString(withNullability: true)),
      'Color' => DataType(name: 'Color', isEnum: false, defaultValue: 'Colors.blue', type: DataTypeEnum.color, typeString: type.getDisplayString(withNullability: true)),
      'DateTime' => DataType(name: 'DateTime', isEnum: false, defaultValue: 'DateTime.now()', type: DataTypeEnum.date, typeString: type.getDisplayString(withNullability: true)),
      'Key' || 'Key?' => DataType(name: 'Key', isEnum: false, defaultValue: 'null', type: DataTypeEnum.key, typeString: type.getDisplayString(withNullability: true)),
      _ when enumValues.isNotEmpty => DataType(
          name: typeString,
          isEnum: true,
          defaultValue: '${typeString}.${enumValues.first}',
          type: DataTypeEnum.enumType,
          enumValues: enumValues,
          typeString: type.getDisplayString(withNullability: true)),
      _ when isFunction => DataType(
          name: typeString,
          isEnum: false,
          defaultValue: _getDefaultValueFunction(type as FunctionType),
          type: DataTypeEnum.function,
          typeString: type.getDisplayString(withNullability: true)),
      _ when isList => DataType(name: typeString, isEnum: false, defaultValue: 'const []', type: DataTypeEnum.list, typeString: type.getDisplayString(withNullability: true)),
      _ => DataType(name: typeString, isEnum: false, defaultValue: 'null', type: DataTypeEnum.custom, typeString: type.getDisplayString(withNullability: true)),
    };

    if (dataType.type == DataTypeEnum.custom) {
      print('Custom type: $type not recognize, default value is null');
    }

    return dataType;
  }

  static String _getDefaultValueFunction(FunctionType type) {
    final parameters = type.parameters.map((e) => '${e.type.getDisplayString(withNullability: true)} ${e.name}').join(', ');
    return '($parameters) {}';
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'isEnum': isEnum,
        'defaultValue': defaultValue,
        'type': type?.index,
        'enumValues': enumValues,
        'typeString': typeString,
      };

  factory DataType.fromMap(Map<String, dynamic> map) => DataType(
        name: map['name'],
        isEnum: map['isEnum'],
        defaultValue: map['defaultValue'],
        type: DataTypeEnum.values[map['type']],
        enumValues: (map['enumValues'] as List<dynamic>?)?.map((e) => e as String).toList(),
        typeString: map['typeString'],
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
  custom,
}
