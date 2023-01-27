package com.metriri.health_connect

import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.ActivityResultRegistry
import androidx.health.connect.client.PermissionController
import androidx.health.connect.client.permission.HealthPermission
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.LifecycleOwner

class HCCycleObserver(private val registry: ActivityResultRegistry) :
    DefaultLifecycleObserver {
    private lateinit var requestPermissions: ActivityResultLauncher<Set<String>>
    private val requestPermissionActivityContract =
        PermissionController.createRequestPermissionResultContract()
    lateinit var responseInternal: (permissionsGranted: Set<String>) -> Unit

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
        permissions: Set<String>,
        response: (permissionsGranted: Set<String>) -> Unit
    ) {
        responseInternal = response
        requestPermissions.launch(permissions)
    }
}