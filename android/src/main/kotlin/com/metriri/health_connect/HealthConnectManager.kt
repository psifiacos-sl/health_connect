package com.metriri.health_connect

import android.app.Activity
import android.content.Context
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContract
import androidx.health.connect.client.HealthConnectClient
import androidx.health.connect.client.PermissionController
import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.HeartRateRecord
import androidx.health.connect.client.records.StepsRecord
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterFragmentActivity

class HealthConnectManager {

    companion object {
        var healthConnectClient: HealthConnectClient? = null
    }

    val PERMISSIONS = setOf(
        HealthPermission.createReadPermission(HeartRateRecord::class),
        HealthPermission.createWritePermission(HeartRateRecord::class),
        HealthPermission.createReadPermission(StepsRecord::class),
        HealthPermission.createWritePermission(StepsRecord::class)
    )

    fun initHealthConnect(context: Context) {
        if (HealthConnectClient.isProviderAvailable(context) && HealthConnectClient.isApiSupported()) {
            healthConnectClient = HealthConnectClient.getOrCreate(context)
        }
    }

    private val requestPermissionActivityContract =
        PermissionController.createRequestPermissionResultContract()
    private lateinit var requestPermissions: ActivityResultLauncher<Set<HealthPermission>>
    fun requestPermission(activity: FlutterFragmentActivity) {
        requestPermissions =
            activity.registerForActivityResult(requestPermissionActivityContract) { granted ->
            }
    }

    private suspend fun checkPermissionsAndRun(healthConnectClient: HealthConnectClient) {
        val granted = healthConnectClient.permissionController.getGrantedPermissions(PERMISSIONS)
        if (granted.containsAll(PERMISSIONS)) {

        } else {
            requestPermissions.launch(PERMISSIONS)
        }
    }
}