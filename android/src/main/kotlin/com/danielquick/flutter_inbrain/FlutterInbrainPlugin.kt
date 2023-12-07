package com.danielquick.flutter_inbrain

import InbrainApi
import android.content.Context
import androidx.annotation.NonNull
import com.inbrain.sdk.InBrain
import com.inbrain.sdk.callback.StartSurveysCallback
import io.flutter.embedding.engine.plugins.FlutterPlugin


/** FlutterInbrainPlugin */
class FlutterInbrainPlugin: FlutterPlugin, InbrainApi {

  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext
    InbrainApi.setUp(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    InbrainApi.setUp(binding.binaryMessenger, null)
  }

  override fun initialize(clientId: String, secret: String, isS2S: Boolean, userId: String) {
    InBrain.getInstance().setInBrain(context, clientId, secret, isS2S, userId);
  }

  override fun showSurveys() {
    InBrain.getInstance().showSurveys(context, object : StartSurveysCallback {
      override fun onSuccess() {
        // successfully opened the survey wall
      }

      override fun onFail(message: String) {
        // failed to open the survey wall
      }
    })
  }

  override fun areSurveysAvailable(): Boolean {
    return true
  }
}
