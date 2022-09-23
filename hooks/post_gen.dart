import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Deleting Temp-File...');

  try {
    final tempFile = File('${Directory.current.path}/.emptyTempFile');
    tempFile.delete();
    progress.complete('Temp-File deleted!');
  } catch (e) {
    progress.fail('Task failed successfully ${e.toString()}');
  }
}
