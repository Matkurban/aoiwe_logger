import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'aoiwe_logger_level.dart';

/// 全局日志管理器（单例）
@internal
class AoiweLoggerConfig {
  AoiweLoggerConfig._internal();

  static final AoiweLoggerConfig _instance = AoiweLoggerConfig._internal();

  factory AoiweLoggerConfig() => _instance;

  // 当前全局日志级别
  AoiweLoggerLevel currentLevel = AoiweLoggerLevel.all;

  ///当前项目名字
  String currentProjectName = '';

  /// 一次性设置级别
  void setConfig({required AoiweLoggerLevel level, required String projectName}) {
    currentLevel = level;
    currentProjectName = projectName;
    developer.log('全局日志级别已更新为: $level', name: '$projectName | setConfig');
  }

  bool get enableLog => currentLevel != AoiweLoggerLevel.off;
}
