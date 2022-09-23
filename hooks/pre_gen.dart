import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final progress = context.logger.progress('Adding Dependencies...');

  final bool isFlutter = context.vars['is_flutter'];
  final dependencies = [
    'riverpod',
    'freezed_annotation',
  ];
  final devDependencies = [
    'build_runner',
    'freezed',
  ];
  final flutterDependencies = ['flutter_riverpod'];

  try {
    for (var i = 0; i < dependencies.length; i++) {
      await _addDependency(dependencies[i]);
    }
    for (var i = 0; i < devDependencies.length; i++) {
      await _addDevDependency(devDependencies[i]);
    }
    if (isFlutter) {
      for (var i = 0; i < flutterDependencies.length; i++) {
        await _addDependency(flutterDependencies[i]);
      }
    }

    progress.complete('Added Dependencies');
  } on AddDependencyFileException catch (e) {
    progress.fail('Adding Dependencies failed ${e.toString()}');
  } catch (e) {
    progress.fail('Task failed succesfully ${e.toString()}');
  }
}

Future<void> _addDevDependency(String package) {
  try {
    return Process.run(
      'flutter',
      [
        'pub',
        'add',
        '-d',
        package,
      ],
    );
  } catch (e, s) {
    throw AddDependencyFileException(e, s);
  }
}

Future<void> _addDependency(String package) {
  try {
    return Process.run(
      'flutter',
      [
        'pub',
        'add',
        package,
      ],
    );
  } catch (e, s) {
    throw AddDependencyFileException(e, s);
  }
}

abstract class GenerateException implements Exception {
  const GenerateException(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;
}

class AddDependencyFileException extends GenerateException {
  const AddDependencyFileException(super.error, super.stackTrace);
}
