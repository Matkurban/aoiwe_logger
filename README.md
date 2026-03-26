# aoiwe_logger

一个轻量、灵活的 Dart/Flutter 日志记录库，底层基于 `dart:developer` 实现。它可以帮助开发者在开发过程中更好地管理、过滤和输出结构化日志。

## 特点 (Features)

* **全局配置管理**：支持一键设置全局日志级别和当前项目名称。
* **多级别日志**：内置 `INFO`、`WARNING`、`ERROR` 等多种常见日志级别。
* **灵活的日志开关**：支持通过全局级别（如 `AoiweLoggerLevel.off`）快速关闭所有日志输出，为生产环境提供便利。
* **IDE 深度集成**：底层使用 `dart:developer` 的 `log` 方法，完美适配 VS Code、Android Studio 以及 Dart DevTools 的调试控制台。

## 安装 (Getting started)

在您的 `pubspec.yaml` 文件中添加依赖项：

```yaml
dependencies:
  aoiwe_logger: ^1.0.0
```

然后在执行 `flutter pub get` 或 `dart pub get` 获取包。

## 使用方法 (Usage)

### 1. 全局初始化配置

建议在应用的入口（如 `main()` 函数）进行一次全局配置，设定项目名称以及需要过滤的最低日志级别：

```dart
import 'package:aoiwe_logger/aoiwe_logger.dart';

void main() {
  // 设置全局配置：只打印 INFO 及以上级别的日志，并指定项目名称
  AoiweLogger.setGlobalConfig(
    level: AoiweLoggerLevel.info, 
    projectName: 'MyFlutterApp',
  );

  // 运行您的应用...
}
```

### 2. 实例化与日志输出

在需要打印日志的类中，创建一个 `AoiweLogger` 实例并传入当前的类名，以便在日志追踪时快速定位：

```dart
import 'package:aoiwe_logger/aoiwe_logger.dart';

class ExampleController {
  // 传入当前类名
  final AoiweLogger logger = AoiweLogger('ExampleController');

  void fetchData() {
    // 打印普通信息日志
    logger.info('开始获取网络数据...', methodName: 'fetchData');
    
    try {
      // 模拟业务逻辑
    } catch (e, stackTrace) {
      // 打印错误日志，支持附带 error 对象和堆栈信息
      logger.error(
        '获取数据失败', 
        methodName: 'fetchData', 
        error: e, 
        stackTrace: stackTrace,
      );
    }
  }
}
```

## 日志级别说明 (Log Levels)

系统内置了以下级别的过滤支持（按优先级从低到高）：

* `AoiweLoggerLevel.all`：打印所有级别的日志
* `AoiweLoggerLevel.info`：常规信息日志
* `AoiweLoggerLevel.warning`：警告日志
* `AoiweLoggerLevel.error`：错误日志
* `AoiweLoggerLevel.off`：关闭所有日志输出

当全局配置为某一级别时，只有**大于或等于**该级别的日志才会被输出。例如配置为 `warning`，则 `info` 级别的日志将被忽略。

## 常见问题 (FAQ)

**Q: 为什么我在普通的命令行终端（Terminal）运行代码，看不到任何日志输出？**

**A:** 因为本库底层使用的是 `dart:developer` 的 `log` 函数。该函数专为 IDE 调试环境设计，默认不会将信息直接打印到标准输出（stdout）。请确保您使用 IDE（如 VS Code 或 Android Studio）的 **Run/Debug (调试模式)** 启动程序，日志将会清晰地展示在 IDE 的 **Debug Console（调试控制台）** 中。