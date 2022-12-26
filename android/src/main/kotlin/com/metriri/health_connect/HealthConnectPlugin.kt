package com.metriri.health_connect

import Utils
import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import com.metriri.health_connect.Constants.Companion.permissionList
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry


/** HealthConnectPlugin */
class HealthConnectPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    private var activity: FlutterFragmentActivity? = null
    private var activityBinding: ActivityPluginBinding? = null

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
                activity?.let { act ->
                    val argument = call.argument(Constants.permissionList) as List<String>?
                    argument?.let { arg ->
                        HealthConnectManager.initHealthConnect(context = act)
                        @Suppress("UNCHECKED_CAST")
                        HealthConnectManager.checkPermissionsAndRun(
                            activity = act,
                            recordsClasses = Utils.fromListStringToRecordClass(arg),
                            response = { records ->
                                val resultList: MutableList<String> = mutableListOf()
                                records.forEach {
                                    resultList.add(it.name)
                                }
                                result.success(resultList)
                            },
                            shouldRun = true
                        )
                    } ?: run {
                        result.error("-1", "", 1)
                    }
                } ?: run {
                    result.error("-1", "", 1)
                }
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
        activityBinding = binding
    }

    override fun onDetachedFromActivityForConfigChanges() {
        // destroyed to change configuration.
        // This call will be followed by onReattachedToActivityForConfigChanges().
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        // after a configuration change.
        activity = binding.activity as FlutterFragmentActivity
        activityBinding = binding
    }

    override fun onDetachedFromActivity() {
        // Clean up references.
        activity = null
    }

}
