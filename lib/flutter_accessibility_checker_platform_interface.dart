import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_accessibility_checker_method_channel.dart';

abstract class FlutterAccessibilityCheckerPlatform extends PlatformInterface {
  /// Constructs a FlutterAccessibilityCheckerPlatform.
  FlutterAccessibilityCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAccessibilityCheckerPlatform _instance = MethodChannelFlutterAccessibilityChecker();

  /// The default instance of [FlutterAccessibilityCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAccessibilityChecker].
  static FlutterAccessibilityCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAccessibilityCheckerPlatform] when
  /// they register themselves.
  static set instance(FlutterAccessibilityCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
