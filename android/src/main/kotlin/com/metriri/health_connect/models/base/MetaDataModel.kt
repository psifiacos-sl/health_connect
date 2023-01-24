package com.metriri.health_connect.models.base

import androidx.health.connect.client.records.Record
import androidx.health.connect.client.records.metadata.DataOrigin
import androidx.health.connect.client.records.metadata.Device
import androidx.health.connect.client.records.metadata.Device.Companion.TYPE_UNKNOWN
import androidx.health.connect.client.records.metadata.Metadata

data class MetaDataModel(
    val id: String = "",
    val dataOrigin: DataOrigin = DataOrigin(""),
    val lastModifiedTime: Long = 0,
    val clientRecordId: String = "",
    val clientRecordVersion: Long = 0,
    val device: Device = Device(manufacturer = "", model = "", type = TYPE_UNKNOWN)
) {
    companion object {
        fun setDataFromRecord(record: Record): MetaDataModel {
            return MetaDataModel(
                id = record.metadata.id,
                dataOrigin = record.metadata.dataOrigin,
                lastModifiedTime = record.metadata.lastModifiedTime.epochSecond,
                clientRecordId = record.metadata.clientRecordId ?: "",
                clientRecordVersion = record.metadata.clientRecordVersion,
                device = record.metadata.device ?: Device(
                    manufacturer = "",
                    model = "",
                    type = TYPE_UNKNOWN
                )
            )
        }
    }
}