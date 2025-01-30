class DataType {
  final String name;
  final String defaultValue;
  final bool isEnum;

  DataType({
    required this.name,
    required this.isEnum,
    required this.defaultValue,
  });

  factory DataType.fromDartType(String type) {
    return switch (type) {
      'string' || 'String' => DataType(name: 'String', isEnum: false, defaultValue: "''"),
      'int' => DataType(name: 'int', isEnum: false, defaultValue: '0'),
      'double' => DataType(name: 'double', isEnum: false, defaultValue: '0.0'),
      'bool' => DataType(name: 'bool', isEnum: false, defaultValue: 'true'),
      _ => DataType(name: type, isEnum: false, defaultValue: 'null'),
    };
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'isEnum': isEnum,
        'defaultValue': defaultValue,
      };

  factory DataType.fromMap(Map<String, dynamic> map) => DataType(
        name: map['name'],
        isEnum: map['isEnum'],
        defaultValue: map['defaultValue'],
      );
}
