import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/messages.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/src/main/kotlin/com/danielquick/flutter_inbrain/Messages.g.kt',
  kotlinOptions: KotlinOptions(),
  swiftOut: 'ios/Runner/Messages.g.swift',
  swiftOptions: SwiftOptions(),
  dartPackageName: 'flutter_inbrain',
))
@HostApi()
abstract class InbrainApi {
  void initialize(String clientId, String secret, bool isS2S, String userId);

  @async
  void showSurveys();

  @async
  bool areSurveysAvailable();
}
