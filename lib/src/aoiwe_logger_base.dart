import 'dart:developer' as developer;

import 'aoiwe_logger_config.dart';
import 'aoiwe_logger_level.dart';

class AoiweLogger {
  final String className;

  AoiweLogger(this.className);

  static final AoiweLoggerConfig _logConfig = AoiweLoggerConfig();

  ///设置全局配置
  static void setGlobalConfig({required AoiweLoggerLevel level, required String projectName}) {
    _logConfig.setConfig(level: level, projectName: projectName);
  }

  void _log({
    required AoiweLoggerLevel level,
    required String message,
    required String methodName,
    Object? error,
    StackTrace? stackTrace,
  }) {
    if (_logConfig.enableLog && level >= _logConfig.currentLevel) {
      developer.log(
        message,
        time: DateTime.now(),
        sequenceNumber: level.value,
        name: ' ${_logConfig.currentProjectName} | ${level.name} | $className.$methodName ',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void info(String message, {String methodName = '', Object? error, StackTrace? stackTrace}) {
    _log(
      level: AoiweLoggerLevel.info,
      message: message,
      methodName: methodName,
      error: error,
      stackTrace: stackTrace,
    );
  }

  void warning(String message, {String methodName = '', Object? error, StackTrace? stackTrace}) {
    _log(
      level: AoiweLoggerLevel.warning,
      message: message,
      methodName: methodName,
      error: error,
      stackTrace: stackTrace,
    );
  }

  void error(String message, {String methodName = '', Object? error, StackTrace? stackTrace}) {
    _log(
      level: AoiweLoggerLevel.error,
      message: message,
      methodName: methodName,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
