import 'package:analyzer/dart/element/type.dart';

class DataType {
  final String name;
  final String defaultValue;
  final DataTypeEnum? type;
  final bool isEnum;
  final bool isFunction;

  DataType({
    required this.name,
    required this.isEnum,
    required this.defaultValue,
    required this.type,
    this.isFunction = false,
  });

  factory DataType.fromDartType({required DartType type}) {
    final typeString = type.getDisplayString(withNullability: true);
    bool isFunction = false;
    if (type is FunctionType) {
      isFunction = true;
    }

    final isList = typeString.contains('List<');
    final dataType = switch (typeString) {
      'string' || 'String' || 'string?' || 'String?' => DataType(name: 'String', isEnum: false, defaultValue: "''", type: DataTypeEnum.string),
      'int' || 'int?' => DataType(name: 'int', isEnum: false, defaultValue: '0', type: DataTypeEnum.int),
      'double' || 'double?' => DataType(name: 'double', isEnum: false, defaultValue: '0.0', type: DataTypeEnum.double),
      'bool' || 'bool?' => DataType(name: 'bool', isEnum: false, defaultValue: 'true', type: DataTypeEnum.bool),
      'Color' => DataType(name: 'Color', isEnum: false, defaultValue: 'Colors.blue', type: DataTypeEnum.color),
      'DateTime' => DataType(name: 'DateTime', isEnum: false, defaultValue: 'DateTime.now()', type: DataTypeEnum.date),
      'Key' || 'Key?' => DataType(name: 'Key', isEnum: false, defaultValue: 'null', type: DataTypeEnum.key),
      _ when isFunction => DataType(name: typeString, isEnum: false, defaultValue: _getDefaultValueFunction(type as FunctionType), type: DataTypeEnum.function),
      _ when isList => DataType(name: typeString, isEnum: false, defaultValue: 'const []', type: DataTypeEnum.list),
      _ => DataType(name: typeString, isEnum: false, defaultValue: 'null', type: DataTypeEnum.custom),
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
      };

  factory DataType.fromMap(Map<String, dynamic> map) => DataType(
        name: map['name'],
        isEnum: map['isEnum'],
        defaultValue: map['defaultValue'],
        type: DataTypeEnum.values[map['type']],
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
  function,
  custom,
}
