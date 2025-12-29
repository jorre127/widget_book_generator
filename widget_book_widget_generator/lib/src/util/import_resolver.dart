import 'package:analyzer/dart/element/element.dart';

class ImportResolver {
  final List<LibraryElement> libs;

  ImportResolver(this.libs);

  String? resolveImport(Element? element) {
    final library = element?.library;
    if (library == null || library.isDartCore) return null;

    for (var lib in libs) {
      if (!lib.isDartCore && lib.exportNamespace.definedNames2.values.contains(element)) {
        return lib.firstFragment.source.uri.toString();
      }
    }
    return null;
  }
}
