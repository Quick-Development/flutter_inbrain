import Flutter
import UIKit
import InBrainSurveys

// Autogenerated from Pigeon (v14.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol InbrainApi {
  func initialize(clientId: String, secret: String, isS2S: Bool, userId: String) throws
  func showSurveys(completion: @escaping (Result<Void, Error>) -> Void)
  func areSurveysAvailable(completion: @escaping (Result<Bool, Error>) -> Void)
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class InbrainApiSetup {
  /// The codec used by InbrainApi.
  /// Sets up an instance of `InbrainApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: InbrainApi?) {
    let initializeChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.flutter_inbrain.InbrainApi.initialize", binaryMessenger: binaryMessenger)
    if let api = api {
      initializeChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let clientIdArg = args[0] as! String
        let secretArg = args[1] as! String
        let isS2SArg = args[2] as! Bool
        let userIdArg = args[3] as! String
        do {
          try api.initialize(clientId: clientIdArg, secret: secretArg, isS2S: isS2SArg, userId: userIdArg)
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      initializeChannel.setMessageHandler(nil)
    }
    let showSurveysChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.flutter_inbrain.InbrainApi.showSurveys", binaryMessenger: binaryMessenger)
    if let api = api {
      showSurveysChannel.setMessageHandler { _, reply in
        api.showSurveys() { result in
          switch result {
            case .success:
              reply(wrapResult(nil))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      showSurveysChannel.setMessageHandler(nil)
    }
    let areSurveysAvailableChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.flutter_inbrain.InbrainApi.areSurveysAvailable", binaryMessenger: binaryMessenger)
    if let api = api {
      areSurveysAvailableChannel.setMessageHandler { _, reply in
        api.areSurveysAvailable() { result in
          switch result {
            case .success(let res):
              reply(wrapResult(res))
            case .failure(let error):
              reply(wrapError(error))
          }
        }
      }
    } else {
      areSurveysAvailableChannel.setMessageHandler(nil)
    }
  }
}


public class FlutterInbrainPlugin: NSObject, FlutterPlugin, InbrainApi {
    func initialize(clientId: String, secret: String, isS2S: Bool, userId: String) throws {
        InBrain.shared.setInBrain(apiClientID: clientId, apiSecret: secret, isS2S: isS2S)
        InBrain.shared.set(userID: userId)
    }
    
    func showSurveys(completion: @escaping (Result<Void, Error>) -> Void) {
        InBrain.shared.showSurveys()
        completion(.success(()))
    }
    
    func areSurveysAvailable(completion: @escaping (Result<Bool, Error>) -> Void) {
        InBrain.shared.checkForAvailableSurveys { [weak self] hasSurveys, _ in
            completion(.success(hasSurveys))
        }
    }
    
  public static func register(with registrar: FlutterPluginRegistrar) {
      let messenger: FlutterBinaryMessenger = registrar.messenger()
      let api: InbrainApi & NSObjectProtocol = FlutterInbrainPlugin.init()
      InbrainApiSetup.setUp(binaryMessenger: messenger, api: api)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
