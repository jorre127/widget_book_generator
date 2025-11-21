import 'package:analyzer/dart/element/element.dart';

class ImportResolver {
  final List<LibraryElement> libs;

  ImportResolver(this.libs);

  String? resolveImport(Element? element) {
    if (element?.firstFragment.libraryFragment?.source == null || _isCoreDartType(element)) return null;
    for (var lib in libs) {
      if (!_isCoreDartType(lib) && lib.exportNamespace.definedNames2.values.contains(element)) return lib.identifier;
    }
    return null;
  }

  bool _isCoreDartType(Element? element) => element!.firstFragment.libraryFragment?.source.fullName == 'dart:core';
}
