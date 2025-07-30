import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_accessibility_checker/flutter_accessibility_checker.dart';
import 'package:flutter_accessibility_checker/flutter_accessibility_checker_platform_interface.dart';
import 'package:flutter_accessibility_checker/flutter_accessibility_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAccessibilityCheckerPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAccessibilityCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAccessibilityCheckerPlatform initialPlatform = FlutterAccessibilityCheckerPlatform.instance;

  test('$MethodChannelFlutterAccessibilityChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAccessibilityChecker>());
  });

  test('getPlatformVersion', () async {
    FlutterAccessibilityChecker flutterAccessibilityCheckerPlugin = FlutterAccessibilityChecker();
    MockFlutterAccessibilityCheckerPlatform fakePlatform = MockFlutterAccessibilityCheckerPlatform();
    FlutterAccessibilityCheckerPlatform.instance = fakePlatform;

    expect(await flutterAccessibilityCheckerPlugin.getPlatformVersion(), '42');
  });
}
