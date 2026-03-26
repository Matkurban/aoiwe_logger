import 'package:aoiwe_logger/aoiwe_logger.dart';

void main() {
  Example example = Example();
  example.testLog();
}

class Example {
  final AoiweLogger logger = AoiweLogger('Example');

  void testLog() {
    logger.info('这是日志', methodName: 'testLog');
  }
}
