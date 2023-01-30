package com.metriri.health_connect

import Utils
import android.content.Context
import androidx.annotation.NonNull
import androidx.health.connect.client.records.HeartRateRecord
import androidx.lifecycle.DefaultLifecycleObserver
import com.google.gson.Gson
import com.metriri.health_connect.models.base.ReadRecordResponseModel
import com.metriri.health_connect.models.base.RecordData
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** HealthConnectPlugin */
class HealthConnectPlugin : FlutterPlugin, MethodCallHandler, ActivityAware{
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    private var activity: FlutterFragmentActivity? = null
    private var context: Context? = null
    private var activityBinding: ActivityPluginBinding? = null

    companion object {
        private var channel: MethodChannel? = null
        val gson = Gson()
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) =
        when (call.method) {
            Constants.getPlatformVersion -> {
                result.success("${Constants.android} ${android.os.Build.VERSION.RELEASE}")
            }
            Constants.checkPermissions -> {
                context?.let { ctx ->
                    val argument = call.argument(Constants.recordClassListArgKey) as List<String>?
                    argument?.let { arg ->
                        when (val hcStatus = HCManager.getOrCreate(ctx = ctx)) {
                            Constants.hCClientStatus.OK -> HCManager.checkPermissions(
                                recordsClasses = arg,
                                response = { records ->
                                    val resultList: MutableList<String> = mutableListOf()
                                    records.forEach {
                                        resultList.add(it.name)
                                    }
                                    val hCResultJson = gson.toJson(resultList)
                                    result.success(hCResultJson)
                                },
                            )
                            else -> resolveHCClientStatusNotOK(result, hcStatus)
                        }
                    } ?: run {
                        result.error(Constants.missingArgument, "No Argument", -1)
                    }
                } ?: run {
                    result.error(Constants.missingActivity, "No Activity", -1)
                }
            }
            Constants.requestPermissions -> {
                context?.let { ctx ->
                    val argument = call.argument(Constants.recordClassListArgKey) as List<String>?
                    argument?.let { arg ->
                        when (val hcStatus = HCManager.getOrCreate(ctx = ctx)) {
                            Constants.hCClientStatus.OK -> HCManager.requestPermissions(
                                recordsClasses = arg,
                                response = { records ->
                                    val resultList: MutableList<String> = mutableListOf()
                                    records.forEach {
                                        resultList.add(it.name)
                                    }
                                    val hCResultJson = gson.toJson(resultList)
                                    result.success(hCResultJson)
                                },
                            )
                            else -> resolveHCClientStatusNotOK(result, hcStatus)
                        }
                    } ?: run {
                        result.error(Constants.missingArgument, "No Argument", -1)
                    }
                } ?: run {
                    result.error(Constants.missingActivity, "No Activity", -1)
                }
            }
            Constants.readData -> {
                context?.let { ctx ->
                    val recordClassArgKey = call.argument(Constants.recordClassArgKey) as String?
                    val startTime = call.argument(Constants.startTime) as Long?
                    val endTime = call.argument(Constants.endTime) as Long?
                    if (recordClassArgKey is String && startTime is Long && endTime is Long) {
                        when (val hcStatus = HCManager.getOrCreate(ctx = ctx)) {
                            Constants.hCClientStatus.OK -> HCManager.readData(recordClass = recordClassArgKey,
                                startTime = startTime,
                                endTime = endTime,
                                response = { response ->
                                    val list = mutableListOf<RecordData>()
                                    response?.records?.forEach {
                                        val v = Utils.fromRecordKClassToModel(
                                            it
                                        )
                                        if (v != null) {
                                            list.add(v)
                                        }
                                    }
                                    val obj = ReadRecordResponseModel(
                                        records = list.toList(),
                                        pageToken = response?.pageToken
                                    )
                                    val hCResultJson = gson.toJson(obj)
                                    result.success(hCResultJson)
                                })
                            else -> resolveHCClientStatusNotOK(result, hcStatus)
                        }
                    } else {
                        result.error(Constants.missingArgument, "No Argument", -1)
                    }
                } ?: run {
                    result.error(Constants.missingActivity, "No Activity", -1)
                }
            }
            Constants.isProviderAvailable -> {
                context?.let { ctx ->
                    when (val hcStatus = HCManager.getOrCreate(ctx = ctx)) {
                        Constants.hCClientStatus.OK -> result.success(hcStatus.name)
                        else -> resolveHCClientStatusNotOK(result, hcStatus)
                    }
                } ?: run {
                    result.error(Constants.missingActivity, "No Activity", -1)
                }
            }
            Constants.writeData -> {
                context?.let { ctx ->
                    when (val hcStatus = HCManager.getOrCreate(ctx = ctx)) {
                        Constants.hCClientStatus.OK -> HCManager.writeData(
                        )
                        else -> resolveHCClientStatusNotOK(result, hcStatus)
                    }
                } ?: run {
                    result.error(Constants.missingActivity, "No Activity", -1)
                }
            }
            else -> {
                result.notImplemented()
            }
        }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger, Constants.methodChannelToAndroid
        )
        channel!!.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
        context = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity as FlutterFragmentActivity
        activityBinding = binding
        val result = initLifecycleObserver()
        if (result) addLifecycleObserver()
    }

    override fun onDetachedFromActivityForConfigChanges() {
        // destroyed to change configuration.
        // This call will be followed by onReattachedToActivityForConfigChanges().
        activity = null
        removeLifecycleObserver()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        // after a configuration change.
        activity = binding.activity as FlutterFragmentActivity
        activityBinding = binding
        val result = initLifecycleObserver()
        if (result) addLifecycleObserver()
    }

    override fun onDetachedFromActivity() {
        // Clean up references.
        activity = null
        removeLifecycleObserver()
    }

    private fun initLifecycleObserver(): Boolean {
        activity?.let { act ->
            HCManager.initLifecycleObserver(act)
            return true
        }
        return false
    }

    private fun addLifecycleObserver(): Boolean {
        activity?.let { act ->
            HCManager.addLifecycleObserver(act)
            return true
        }
        return false
    }

    private fun removeLifecycleObserver(): Boolean {
        activity?.let { act ->
            HCManager.removeLifecycleObserver(act)
            return true
        }
        return false

    }

    private fun resolveHCClientStatusNotOK(
        result: Result, hCClientStatus: Constants.hCClientStatus
    ) {
        when (hCClientStatus) {
            Constants.hCClientStatus.ApiNotSupported -> result.error(
                Constants.hCClientStatus.ApiNotSupported.name, "SDK version too low", -1
            )
            Constants.hCClientStatus.ProviderNotAvailable -> result.error(
                Constants.hCClientStatus.ProviderNotAvailable.name, "Service not available", -1
            )
            else -> result.error(
                Constants.hCClientStatus.UnKnown.name, "Status: UnKnown", -1
            )
        }

    }
}
