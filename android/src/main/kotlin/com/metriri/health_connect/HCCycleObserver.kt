package com.metriri.health_connect

import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.ActivityResultRegistry
import androidx.health.connect.client.PermissionController
import androidx.health.connect.client.permission.HealthPermission
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner

class HCCycleObserver(private val registry: ActivityResultRegistry) :
    DefaultLifecycleObserver {
    private lateinit var requestPermissions: ActivityResultLauncher<Set<HealthPermission>>
    private val requestPermissionActivityContract =
        PermissionController.createRequestPermissionResultContract()
    lateinit var responseInternal: (permissionsGranted: Set<HealthPermission>) -> Unit

    override fun onCreate(owner: LifecycleOwner) {
        requestPermissions =
            registry.register(
                Constants.registerPermissionsOberver,
                requestPermissionActivityContract
            ) { granted ->
                responseInternal(granted)
            }
    }

    fun launchRequestPermissions(
        permissions: Set<HealthPermission>,
        response: (permissionsGranted: Set<HealthPermission>) -> Unit
    ) {
        responseInternal = response
        requestPermissions.launch(permissions)
    }
}