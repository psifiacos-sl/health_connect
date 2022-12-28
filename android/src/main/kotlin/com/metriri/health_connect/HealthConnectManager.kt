package com.metriri.health_connect

import Utils
import android.content.Context
import androidx.activity.result.ActivityResult
import androidx.activity.result.ActivityResultCallback
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import androidx.health.connect.client.HealthConnectClient
import androidx.health.connect.client.PermissionController
import androidx.health.connect.client.permission.HealthPermission
import io.flutter.embedding.android.FlutterFragmentActivity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch

object HealthConnectManager {


    private val requestPermissionActivityContract =
        PermissionController.createRequestPermissionResultContract()
    private var healthConnectClient: HealthConnectClient? = null
    private val job = SupervisorJob()
    private val scope by lazy { CoroutineScope(Dispatchers.IO + job) }

    fun initHealthConnect(activity: FlutterFragmentActivity): Constants.HealthConnectClientStatus {
        var status: Constants.HealthConnectClientStatus =
            Constants.HealthConnectClientStatus.UnKnown
        try {
            if(healthConnectClient != null)
                return Constants.HealthConnectClientStatus.OK

            healthConnectClient = HealthConnectClient.getOrCreate(activity)
            status = Constants.HealthConnectClientStatus.OK
            healthConnectCycleObserver = HealthConnectCycleObserver(
                activity.activityResultRegistry
            )
            activity.lifecycle.addObserver(healthConnectCycleObserver)

        } catch (e: Exception) {
            if (e is IllegalStateException) {
                status = Constants.HealthConnectClientStatus.ProviderNotSupported
            } else if (e is UnsupportedOperationException) {
                status = Constants.HealthConnectClientStatus.ApiNotSupported
            }
        }
        return status
    }


    lateinit var healthConnectCycleObserver: HealthConnectCycleObserver
    private lateinit var requestPermissions: ActivityResultLauncher<Set<HealthPermission>>
    private fun requestPermissions(
        activity: FlutterFragmentActivity,
        permissions: Set<HealthPermission>,
        recordsClasses: Set<Constants.RecordClass>,
        response: (records: Set<Constants.RecordClass>) -> Unit
    ) {
        healthConnectCycleObserver.launchPermissions(permissions)
//        requestPermissions =
//            activity.registerForActivityResult(requestPermissionActivityContract) { granted ->
//                if (granted.containsAll(permissions)) {
//                    response(recordsClasses)
//                } else {
//                    response(setOf())
//                }
//            }
//        requestPermissions.launch(permissions)
    }

    fun checkPermissionsAndRun(
        activity: FlutterFragmentActivity,
        recordsClasses: Set<Constants.RecordClass>,
        response: (records: Set<Constants.RecordClass>) -> Unit,
        shouldRun: Boolean
    ) {
        scope.launch {
            val permissions: Set<HealthPermission> =
                Utils.fromRecordClassesToPermissions(recordsClasses)
            val granted =
                healthConnectClient?.permissionController?.getGrantedPermissions(permissions)
            if (granted?.containsAll(permissions) == true) {
                response(recordsClasses)
            } else {
                if (shouldRun) requestPermissions(activity, permissions, recordsClasses, response)
            }
        }
    }


}