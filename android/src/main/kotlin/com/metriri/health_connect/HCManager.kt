package com.metriri.health_connect

import Utils
import android.util.Log
import androidx.health.connect.client.HealthConnectClient
import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.Record
import androidx.health.connect.client.records.StepsRecord
import androidx.health.connect.client.records.metadata.Metadata
import androidx.health.connect.client.request.ReadRecordsRequest
import androidx.health.connect.client.response.InsertRecordsResponse
import androidx.health.connect.client.response.ReadRecordsResponse
import androidx.health.connect.client.time.TimeRangeFilter
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterFragmentActivity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import java.time.Instant
import java.time.ZoneOffset
import java.time.temporal.TemporalUnit
import kotlin.reflect.KClass

object HCManager {

    private var hCClient: HealthConnectClient? = null
    var hCCycleObserver: HCCycleObserver? = null
    private val job = SupervisorJob()
    private val scope by lazy { CoroutineScope(Dispatchers.IO + job) }

    fun getOrCreate(activity: FlutterFragmentActivity): Constants.hCClientStatus {
        var status: Constants.hCClientStatus =
            Constants.hCClientStatus.UnKnown
        try {
            hCClient = HealthConnectClient.getOrCreate(activity)
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
        recordsClasses: List<String>,
        response: (records: Set<Constants.RecordClass>) -> Unit,
    ) {
        val permissions: Set<HealthPermission> =
            Utils.fromRecordClassesToPermissions(recordsClasses)
        hCCycleObserver?.launchRequestPermissions(permissions) {
            val result = permissions.intersect(it.toSet())
            val resultRecordClasses = Utils.fromPermissionsToRecordClasses(result)
            response(resultRecordClasses)
        }
    }

    fun checkPermissions(
        recordsClasses: List<String>,
        response: (records: Set<Constants.RecordClass>) -> Unit,
    ) {
        scope.launch {
            val permissions: Set<HealthPermission> =
                Utils.fromRecordClassesToPermissions(recordsClasses)
            val granted =
                hCClient?.permissionController?.getGrantedPermissions(permissions)
            val result = permissions.intersect((granted ?: setOf()).toSet())
            val resultRecordClasses = Utils.fromPermissionsToRecordClasses(result)
            response(resultRecordClasses)
        }
    }

    fun readData(
        recordClass: String,
        response: (readRecordsResponse: ReadRecordsResponse<out Record>?) -> Unit,
    ) {
        checkPermissions(listOf(recordClass)) { record ->
            scope.launch {
                val kClass = Constants.RecordClass.valueOf(recordClass).kC
                val result = hCClient?.readRecords(
                    ReadRecordsRequest(
                        kClass,
                        timeRangeFilter = TimeRangeFilter.between(
                            Instant.now().minusSeconds(259200), Instant.now()
                        ),
                    )
                )
                response(result)
            }
        }
    }

    fun writeData() {
        val stepsRecord =
            StepsRecord(
                count = 12340,
                startTime = Instant.now().minusSeconds(60),
                endTime = Instant.now(),
                startZoneOffset = ZoneOffset.UTC,
                endZoneOffset = ZoneOffset.UTC,
            )
        scope.launch {
            val result: InsertRecordsResponse? = hCClient?.insertRecords(listOf(stepsRecord))
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