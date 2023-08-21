import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:fix_matcher_runtime/src/fix_runtime_command.dart';
import 'package:ide_plugin/ide_plugin.dart';

Future<void> main(List<String> args) async {
  final runner = CommandRunner(
    "fix_matcher_runtime",
    "fix_matcher_runtime description",
  );
  addCommands.forEach((element) => runner.addCommand(element));
  try {
    await runner.run(args);
  } on UsageException catch (e) {
    stdout.writeln(e.toString());
  } on String catch (e) {
    stdout.writeln(e);
  }
}

List<BaseCommand> get addCommands {
  return [FixRuntimeCommand()];
}
