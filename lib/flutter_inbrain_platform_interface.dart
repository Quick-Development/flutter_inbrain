import 'package:flutter_inbrain/flutter_inbrain_pigeon.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_inbrain_method_channel.dart';

abstract class FlutterInbrainPlatform extends PlatformInterface {
  /// Constructs a FlutterInbrainPlatform.
  FlutterInbrainPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterInbrainPlatform _instance = FlutterInbrainPigeon();

  /// The default instance of [FlutterInbrainPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterInbrain].
  static FlutterInbrainPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterInbrainPlatform] when
  /// they register themselves.
  static set instance(FlutterInbrainPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize(
      String clientId, String secret, bool isS2S, String userId) {
    throw UnimplementedError('initialize has not been implemented.');
  }

  Future<void> showSurveys() {
    throw UnimplementedError('showSurveys has not been implemented.');
  }

  Future<bool> areSurveysAvailable() {
    throw UnimplementedError('areSurveysAvailable has not been implemented.');
  }
}
