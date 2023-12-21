package com.danielquick.flutter_inbrain

import FlutterError
import InbrainApi
import android.app.Activity
import android.graphics.Color
import androidx.annotation.NonNull
import com.inbrain.sdk.InBrain
import com.inbrain.sdk.callback.StartSurveysCallback
import com.inbrain.sdk.callback.SurveysAvailableCallback
import com.inbrain.sdk.config.StatusBarConfig
import com.inbrain.sdk.config.ToolBarConfig
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
    val toolBarConfig = ToolBarConfig()
    val statusBarConfig = StatusBarConfig()
    statusBarConfig.statusBarColorResId = R.color.inbrain_color
    statusBarConfig.isStatusBarIconsLight = false
    toolBarConfig.title = "Answer2Earn" // set title

    toolBarConfig.setToolbarColorResId(R.color.inbrain_color) // set toolbar color with status bar
      .setBackButtonColorResId(android.R.color.white) // set icon color
      .setTitleColorResId(android.R.color.white); //  set toolbar text

    toolBarConfig.setElevationEnabled(false)
    InBrain.getInstance().setToolbarConfig(toolBarConfig)
    InBrain.getInstance().setStatusBarConfig(statusBarConfig)
  }

  override fun showSurveys(callback: (Result<Unit>) -> Unit) {
    InBrain.getInstance().showSurveys(activity, object : StartSurveysCallback {
      override fun onSuccess() {
        callback(Result.success(Unit))
      }

      override fun onFail(message: String) {
        println("surveys error: $message");
        callback(Result.failure(FlutterError("0", message, "")))
      }
    })
  }

  override fun areSurveysAvailable(callback: (Result<Boolean>) -> Unit) {
    InBrain.getInstance().areSurveysAvailable(activity, object : SurveysAvailableCallback {
      override fun onSurveysAvailable(available: Boolean) {
        callback(Result.success(available))
      }
    })
  }
}
