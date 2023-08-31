import 'package:analyze_cache/analyze_cache.dart';
import 'package:ide_plugin/ide_plugin.dart';
import 'package:plugin_channel/src/channel_resource.dart';
import 'package:darty_json_safe/darty_json_safe.dart';

import 'fix_runtime.dart';

class FixRuntimeCommand extends BaseCommand {
  @override
  String get description => '修复运行时库错误';

  @override
  String get name => 'fix_runtime';

  @override
  Future<ChannelResponse> runPlugin(ChannelResource resource) async {
    final request = await resource.readRequestResource();
    final json = JSON(request.data);

    /// 获取分析的文件路径
    final filePath = json['filePath'].stringValue;

    /// 获取缓存的数据
    final cacheData = json['cacheData'].mapValue;
    final cache = AnalyzerFileCache(cacheData,
        cacheData.map((key, value) => MapEntry(key.toString(), value)));
    FixRuntime(filePath, cache).fix();
    return ChannelResponse.success(cache.toJson());
  }
}
