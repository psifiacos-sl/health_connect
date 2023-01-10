package com.metriri.health_connect

import Utils
import androidx.annotation.NonNull
import androidx.lifecycle.DefaultLifecycleObserver
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** HealthConnectPlugin */
class HealthConnectPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    DefaultLifecycleObserver {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity

    private var activity: FlutterFragmentActivity? = null
    private var activityBinding: ActivityPluginBinding? = null

    companion object {
        private var channel: MethodChannel? = null
        val gson = Gson()
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            Constants.getPlatformVersion -> {
                result.success("${Constants.android} ${android.os.Build.VERSION.RELEASE}")
            }
            Constants.checkPermissions -> {
                activity?.let { act ->
                    val argument = call.argument(Constants.recordClassListArgKey) as List<String>?
                    argument?.let { arg ->
                        when (val hcStatus = HCManager.getOrCreate(activity = act)) {
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
                activity?.let { act ->
                    val argument = call.argument(Constants.recordClassListArgKey) as List<String>?
                    argument?.let { arg ->
                        when (val hcStatus = HCManager.getOrCreate(activity = act)) {
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
                activity?.let { act ->
                    val argument = call.argument(Constants.recordClassArgKey) as String?
                    argument?.let { arg ->
                        when (val hcStatus = HCManager.getOrCreate(activity = act)) {
                            Constants.hCClientStatus.OK -> HCManager.readData(
                                recordClass = arg,
                                response = { response ->
                                    val hCResultJson = gson.toJson(response)
                                    result.success(hCResultJson)
                                }
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
            Constants.isProviderAvailable -> {
                activity?.let { act ->
                    when (val hcStatus = HCManager.getOrCreate(activity = act)) {
                        Constants.hCClientStatus.OK -> result.success(hcStatus.name)
                        else -> resolveHCClientStatusNotOK(result, hcStatus)
                    }
                } ?: run {
                    result.error(Constants.missingActivity, "No Activity", -1)
                }
            }
            Constants.writeData -> {
                activity?.let { act ->
                    when (val hcStatus = HCManager.getOrCreate(activity = act)) {
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
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(
            flutterPluginBinding.binaryMessenger, Constants.methodChannelToAndroid
        )
        channel!!.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel?.setMethodCallHandler(null)
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
        result: Result,
        hCClientStatus: Constants.hCClientStatus
    ) {
        when (hCClientStatus) {
            Constants.hCClientStatus.ApiNotSupported ->
                result.error(
                    Constants.hCClientStatus.ApiNotSupported.name,
                    "SDK version too low",
                    -1
                )
            Constants.hCClientStatus.ProviderNotAvailable ->
                result.error(
                    Constants.hCClientStatus.ProviderNotAvailable.name,
                    "Service not available",
                    -1
                )
            else ->
                result.error(
                    Constants.hCClientStatus.UnKnown.name,
                    "Status: UnKnown",
                    -1
                )
        }

    }
}
