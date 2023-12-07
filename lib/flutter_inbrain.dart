import 'flutter_inbrain_platform_interface.dart';

class FlutterInbrain {
  Future<void> initialize(
      String clientId, String secret, bool isS2S, String userId) {
    return FlutterInbrainPlatform.instance
        .initialize(clientId, secret, isS2S, userId);
  }

  Future<void> showSurveys() {
    return FlutterInbrainPlatform.instance.showSurveys();
  }

  Future<bool> areSurveysAvailable() {
    return FlutterInbrainPlatform.instance.areSurveysAvailable();
  }
}
