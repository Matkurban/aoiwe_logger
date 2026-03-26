import 'dart:core';

class AoiweLoggerLevel implements Comparable<AoiweLoggerLevel> {
  final String name;

  final int value;

  const AoiweLoggerLevel(this.name, this.value);

  ///打印所有的日志
  static const AoiweLoggerLevel all = AoiweLoggerLevel('ALL', 0);

  ///关闭所有日志
  static const AoiweLoggerLevel off = AoiweLoggerLevel('OFF', 2000);

  ///info 日志
  static const AoiweLoggerLevel info = AoiweLoggerLevel('INFO', 800);

  ///warning 日志
  static const AoiweLoggerLevel warning = AoiweLoggerLevel('warning', 900);

  ///error 日志
  static const AoiweLoggerLevel error = AoiweLoggerLevel('error', 1000);

  @override
  bool operator ==(Object other) => other is AoiweLoggerLevel && value == other.value;

  bool operator <(AoiweLoggerLevel other) => value < other.value;

  bool operator <=(AoiweLoggerLevel other) => value <= other.value;

  bool operator >(AoiweLoggerLevel other) => value > other.value;

  bool operator >=(AoiweLoggerLevel other) => value >= other.value;

  @override
  int compareTo(AoiweLoggerLevel other) => value - other.value;

  @override
  int get hashCode => value;

  @override
  String toString() => name;
}
