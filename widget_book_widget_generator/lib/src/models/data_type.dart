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

  factory DataType.fromDartType({required String type, required hasParameters}) {
    final dataType = switch (type) {
      'string' || 'String' || 'string?' || 'String?' => DataType(name: 'String', isEnum: false, defaultValue: "''", type: DataTypeEnum.string),
      'int' || 'int?' => DataType(name: 'int', isEnum: false, defaultValue: '0', type: DataTypeEnum.int),
      'double' || 'double?' => DataType(name: 'double', isEnum: false, defaultValue: '0.0', type: DataTypeEnum.double),
      'bool' || 'bool?' => DataType(name: 'bool', isEnum: false, defaultValue: 'true', type: DataTypeEnum.bool),
      'Color' => DataType(name: 'Color', isEnum: false, defaultValue: 'Colors.blue', type: DataTypeEnum.color),
      'DateTime' => DataType(name: 'DateTime', isEnum: false, defaultValue: 'DateTime.now()', type: DataTypeEnum.date),
      ('void Function()' || 'Future<void> Function()') => DataType(name: 'Function', isEnum: false, defaultValue: '() {}', type: DataTypeEnum.function),
      _ when hasParameters => DataType(name: type, isEnum: false, defaultValue: 'null', type: DataTypeEnum.function),
      _ => DataType(name: type, isEnum: false, defaultValue: 'null', type: DataTypeEnum.custom),
    };

    if (dataType.type == DataTypeEnum.custom) {
      print('Custom type: $type not recognize, default value is null');
    }
    
    return dataType;
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
  double,
  bool,
  date,
  color,
  function,
  custom,
}
