import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_accessibility_checker_platform_interface.dart';

/// An implementation of [FlutterAccessibilityCheckerPlatform] that uses method channels.
class MethodChannelFlutterAccessibilityChecker extends FlutterAccessibilityCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_accessibility_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
