package com.metriri.health_connect

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** HealthConnectPlugin */
class HealthConnectPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    private var activity: FlutterFragmentActivity? = null
    companion object {
        private var channel: MethodChannel? = null
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger,
            Constants.methodChannelToAndroid
        )
        channel!!.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            Constants.getPlatformVersion -> {
                result.success("${Constants.android} ${android.os.Build.VERSION.RELEASE}")
            }
            Constants.requestPermissions -> {
                val arguments = call.arguments
                activity?.let {
                    HealthConnectManager.initHealthConnect(context = it)
                    HealthConnectManager.checkPermissionsAndRun(activity = it, recordsClasses = call.arguments as List<Constants.RecordClass>, response = { records ->
                        result.success(records)
                    })
                }
                result.error("-1", "", 1)
            }
            Constants.isAuthorized -> {
                result.notImplemented()
            }
            Constants.readData -> {

            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity as FlutterFragmentActivity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        // destroyed to change configuration.
        // This call will be followed by onReattachedToActivityForConfigChanges().
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        // after a configuration change.
        activity = binding.activity as FlutterFragmentActivity
    }

    override fun onDetachedFromActivity() {
        // Clean up references.
        activity = null
    }

}
