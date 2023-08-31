import 'package:test/test.dart';

import '../bin/fix_collection_runtime.dart' as fix_collection_runtime;

void main() {
  test(
    'test fix runtime',
    (() async {
      await fix_collection_runtime.main([
        "fix_collection_runtime",
        'fix_runtime' '-i' "d68c8bf87120c56c4f8d658ec365293f"
      ]);
    }),
    timeout: Timeout.none,
  );
}
