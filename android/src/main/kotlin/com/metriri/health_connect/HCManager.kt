package com.metriri.health_connect

import Utils
import android.content.Context
import android.util.Log
import androidx.health.connect.client.HealthConnectClient
import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.*
import androidx.health.connect.client.records.metadata.Metadata
import androidx.health.connect.client.request.ReadRecordsRequest
import androidx.health.connect.client.response.InsertRecordsResponse
import androidx.health.connect.client.response.ReadRecordsResponse
import androidx.health.connect.client.time.TimeRangeFilter
import androidx.health.connect.client.units.Energy
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterFragmentActivity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import java.time.Instant
import java.time.ZoneOffset

object HCManager {

    private var hCClient: HealthConnectClient? = null
    var hCCycleObserver: HCCycleObserver? = null
    private val job = SupervisorJob()
    private val scope by lazy { CoroutineScope(Dispatchers.IO + job) }

    fun getOrCreate(ctx: Context): Constants.hCClientStatus {
        var status: Constants.hCClientStatus =
            Constants.hCClientStatus.UnKnown
        try {
            hCClient = HealthConnectClient.getOrCreate(ctx)
            status = Constants.hCClientStatus.OK

        } catch (e: Exception) {
            if (e is IllegalStateException) {
                status = Constants.hCClientStatus.ProviderNotAvailable
            } else if (e is UnsupportedOperationException) {
                status = Constants.hCClientStatus.ApiNotSupported
            }
        }
        return status
    }

    fun requestPermissions(
        hcPermissions: List<String>,
        response: (records: Set<Constants.HCPermission>) -> Unit,
    ) {
        val permissions = Utils.fromHCPermissionsToPermissions(hcPermissions)
        hCCycleObserver?.launchRequestPermissions(permissions) {
            val grantedHCPermissions = Utils.fromPermissionsToHCPermissions(it)
            response(grantedHCPermissions)
        }
    }

    fun checkPermissions(
        response: (records: Set<Constants.HCPermission>) -> Unit,
    ) {
        scope.launch {
            val granted =
                hCClient?.permissionController?.getGrantedPermissions() ?: setOf()
            val hcPermissions = Utils.fromPermissionsToHCPermissions(granted)
            response(hcPermissions)
        }
    }

    fun readData(
        recordClass: String,
        startTime: Long,
        endTime: Long,
        response: (readRecordsResponse: ReadRecordsResponse<out Record>?) -> Unit,
    ) {
        checkPermissions { record ->
            scope.launch {
                val kClass = Constants.RecordClass.valueOf(recordClass).kC
                val result = hCClient?.readRecords(
                    ReadRecordsRequest(
                        kClass,
                        timeRangeFilter = TimeRangeFilter.between(
                            Instant.ofEpochMilli(startTime), Instant.ofEpochMilli(endTime)
                        ),
                    )
                )
                response(result)
            }
        }
    }

    fun writeData() {
        val record =
            ActiveCaloriesBurnedRecord(
                energy = Energy.calories(
                    3000.0
                ),
                metadata = Metadata(
                    lastModifiedTime = Instant.now().minusSeconds(2000)
                ),
                startTime = Instant.now().minusSeconds(1000),
                endTime = Instant.now(),
                startZoneOffset = ZoneOffset.ofHours(4),
                endZoneOffset = ZoneOffset.ofHours(6)

            )
        scope.launch {
            val result: InsertRecordsResponse? = hCClient?.insertRecords(listOf(record))
            Log.i("Write result", Gson().toJson(result))
        }
    }

    fun addLifecycleObserver(act: FlutterFragmentActivity) {
        hCCycleObserver?.let {
            act.lifecycle.addObserver(it)
        }
    }

    fun initLifecycleObserver(act: FlutterFragmentActivity) {
        if (hCCycleObserver == null)
            hCCycleObserver = HCCycleObserver(
                act.activityResultRegistry
            )
    }

    fun removeLifecycleObserver(act: FlutterFragmentActivity) {
        hCCycleObserver?.let {
            act.lifecycle.removeObserver(it)
        }
    }


}