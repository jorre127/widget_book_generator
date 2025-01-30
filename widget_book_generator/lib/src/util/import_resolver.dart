import 'package:analyzer/dart/element/element.dart';

class ImportResolver {
  final List<LibraryElement> libs;

  ImportResolver(this.libs);

  String? resolveImport(Element? element) {
    // return early if source is null or element is a core type
    if (element?.source == null || _isCoreDartType(element)) {
      return null;
    }

    for (var lib in libs) {
      if (!_isCoreDartType(lib) && lib.exportNamespace.definedNames.values.contains(element)) {
        return lib.identifier;
      }
    }
    return null;
  }

  bool _isCoreDartType(Element? element) => element?.source?.fullName == 'dart:core';
}
