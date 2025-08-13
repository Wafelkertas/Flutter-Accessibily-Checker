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
              var anyEnabled =
                  UIAccessibility.isVoiceOverRunning ||
                  UIAccessibility.isInvertColorsEnabled ||
                  UIAccessibility.isReduceMotionEnabled ||
                  UIAccessibility.isReduceTransparencyEnabled ||
                  UIAccessibility.isBoldTextEnabled ||
                  UIAccessibility.isGrayscaleEnabled ||
                  UIAccessibility.isSwitchControlRunning

              if #available(iOS 14.0, *) {
                  anyEnabled = anyEnabled ||
                      UIAccessibility.shouldDifferentiateWithoutColor ||
                      UIAccessibility.buttonShapesEnabled ||
                      UIAccessibility.onOffSwitchLabelsEnabled ||
                      UIAccessibility.isDarkerSystemColorsEnabled ||
                      UIAccessibility.isGuidedAccessEnabled
              }

              result(anyEnabled)

      default:
          result(FlutterMethodNotImplemented)
      }
  }
}
