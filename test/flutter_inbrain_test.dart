import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_inbrain/flutter_inbrain.dart';
import 'package:flutter_inbrain/flutter_inbrain_platform_interface.dart';
import 'package:flutter_inbrain/flutter_inbrain_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterInbrainPlatform
    with MockPlatformInterfaceMixin
    implements FlutterInbrainPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<bool> areSurveysAvailable() {
    // TODO: implement areSurveysAvailable
    throw UnimplementedError();
  }

  @override
  Future<void> initialize(
      String clientId, String secret, bool isS2S, String userId) {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  @override
  Future<void> showSurveys() {
    // TODO: implement showSurveys
    throw UnimplementedError();
  }
}

void main() {
  final FlutterInbrainPlatform initialPlatform =
      FlutterInbrainPlatform.instance;

  test('$MethodChannelFlutterInbrain is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterInbrain>());
  });

  test('getPlatformVersion', () async {
    FlutterInbrain flutterInbrainPlugin = FlutterInbrain();
    MockFlutterInbrainPlatform fakePlatform = MockFlutterInbrainPlatform();
    FlutterInbrainPlatform.instance = fakePlatform;
  });
}
