import 'package:analyze_cache/analyze_cache.dart';
import 'package:darty_json_safe/darty_json_safe.dart';

class FixRuntime {
  final String filePath;
  final AnalyzerFileCache fileCache;
  const FixRuntime(this.filePath, this.fileCache);

  fix() {
    fileCache.classs.forEach(_fixClass);
    fileCache.extensions.forEach(_fixExtension);
    fileCache.topLevelVariables.forEach(_fixPropertyAccessor);
    fileCache.functions.forEach(_fixMethod);
    fileCache.enums.forEach(_fixEnum);
    fileCache.mixins.forEach(_fixMixin);
    fileCache.imports.forEach(_fixImport);
  }

  _fixClass(AnalyzerClassCache cache) {
    cache.fields.forEach(_fixPropertyAccessor);
    cache.methods.forEach(_fixMethod);
    cache.constructors.forEach(_fixMethod);
  }

  _fixExtension(AnalyzerExtensionCache cache) {
    cache.fields.forEach(_fixPropertyAccessor);
    cache.methods.forEach(_fixMethod);
  }

  _fixPropertyAccessor(AnalyzerPropertyAccessorCache cache) {}

  _fixMethod(AnalyzerMethodCache cache) {
    cache.parameters.forEach(_fixPropertyAccessor);
  }

  _fixEnum(AnalyzerEnumCache cache) {
    cache.fields.forEach(_fixPropertyAccessor);
    cache.methods.forEach(_fixMethod);
  }

  _fixMixin(AnalyzerMixinCache cache) {
    cache.fields.forEach(_fixPropertyAccessor);
    cache.methods.forEach(_fixMethod);
    cache.constructors.forEach(_fixMethod);
  }

  _fixImport(AnalyzerImportCache cache) {
    Unwrap(cache.namespace).map(_fixNamespace);
  }

  _fixNamespace(AnalyzerNameSpaceCache cache) {}
}
