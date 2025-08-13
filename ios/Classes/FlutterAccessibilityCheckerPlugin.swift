import Flutter
import UIKit

public class FlutterAccessibilityCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_accessibility_checker", binaryMessenger: registrar.messenger())
    let instance = FlutterAccessibilityCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      switch call.method {
      case "getPlatformVersion":
          result("iOS " + UIDevice.current.systemVersion)

      case "isAnyFeatureOn":
              if #available(iOS 14.0, *) {
                  let anyEnabled =
                      UIAccessibility.isVoiceOverRunning ||
                      UIAccessibility.isInvertColorsEnabled ||
                      UIAccessibility.isReduceMotionEnabled ||
                      UIAccessibility.isReduceTransparencyEnabled ||
                      UIAccessibility.isBoldTextEnabled ||
                      UIAccessibility.isGrayscaleEnabled ||
                      UIAccessibility.isSwitchControlRunning ||
                      UIAccessibility.shouldDifferentiateWithoutColor ||
                      UIAccessibility.buttonShapesEnabled ||
                      UIAccessibility.onOffSwitchLabelsEnabled ||
                      UIAccessibility.isDarkerSystemColorsEnabled ||
                      UIAccessibility.isGuidedAccessEnabled
                  result(anyEnabled)
              } else {
                  // Fallback for iOS < 14
                  result(false)
              }

      default:
          result(FlutterMethodNotImplemented)
      }
  }
}
