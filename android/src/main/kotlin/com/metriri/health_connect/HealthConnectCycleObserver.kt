package com.metriri.health_connect

import android.util.Log
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.ActivityResultRegistry
import androidx.activity.result.contract.ActivityResultContracts.GetContent
import androidx.health.connect.client.PermissionController
import androidx.health.connect.client.permission.HealthPermission
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner

class HealthConnectCycleObserver(private val registry: ActivityResultRegistry) :
    DefaultLifecycleObserver {
    private lateinit var requestPermissions: ActivityResultLauncher<Set<HealthPermission>>
    private val requestPermissionActivityContract =
        PermissionController.createRequestPermissionResultContract()

    override fun onCreate(owner: LifecycleOwner) {
        requestPermissions =
            registry.register("key111", requestPermissionActivityContract) { granted ->
                Log.i("list", granted.size.toString())
            }
    }

    fun launchPermissions(permissions: Set<HealthPermission>){
        requestPermissions.launch(permissions)
    }
}