import 'package:flutter_inbrain/flutter_inbrain_platform_interface.dart';
import 'package:flutter_inbrain/src/messages.g.dart';

class FlutterInbrainPigeon extends FlutterInbrainPlatform {
  final InbrainApi _api = InbrainApi();

  @override
  Future<void> initialize(
      String clientId, String secret, bool isS2S, String userId) {
    return _api.initialize(clientId, secret, isS2S, userId);
  }

  @override
  Future<void> showSurveys() {
    return _api.showSurveys();
  }

  @override
  Future<bool> areSurveysAvailable() {
    return _api.areSurveysAvailable();
  }
}
