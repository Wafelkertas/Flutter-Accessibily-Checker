
import 'package:flutter/services.dart';

import 'flutter_accessibility_checker_platform_interface.dart';

class FlutterAccessibilityChecker {

  static const MethodChannel _channel = MethodChannel('flutter_accessibility_checker');

  /// Returns true if *any* accessibility feature is turned on
  static Future<bool> isAnyAccessibilityFeatureOn() async {
    final bool result = await _channel.invokeMethod('isAnyFeatureOn');
    return result;
  }

  Future<String?> getPlatformVersion() {
    return FlutterAccessibilityCheckerPlatform.instance.getPlatformVersion();
  }
}
