package com.danielquick.flutter_inbrain

import InbrainApi
import android.content.Context
import android.app.Activity;
import androidx.annotation.NonNull
import com.inbrain.sdk.InBrain
import com.inbrain.sdk.callback.StartSurveysCallback
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding



/** FlutterInbrainPlugin */
class FlutterInbrainPlugin: FlutterPlugin, InbrainApi, ActivityAware {

  private lateinit var activity: Activity
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    InbrainApi.setUp(flutterPluginBinding.binaryMessenger, this)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    InbrainApi.setUp(binding.binaryMessenger, null)
  }

  
  override fun onDetachedFromActivity() {
      
  }

  override fun onDetachedFromActivityForConfigChanges() {
      
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
      
  }

  override fun initialize(clientId: String, secret: String, isS2S: Boolean, userId: String) {
    InBrain.getInstance().setInBrain(activity, clientId, secret, isS2S, userId);
  }

  override fun showSurveys() {
    println("trying to show surveys");
    InBrain.getInstance().showSurveys(activity, object : StartSurveysCallback {
      override fun onSuccess() {
        println("surveys shown successfully");
        // successfully opened the survey wall
      }

      override fun onFail(message: String) {
        println("surveys error: " + message);
        // failed to open the survey wall
      }
    })
  }

  override fun areSurveysAvailable(): Boolean {
    return true
  }
}
