package com.metriri.health_connect.models

import androidx.health.connect.client.records.HydrationRecord
import androidx.health.connect.client.units.Volume
import com.metriri.health_connect.models.base.IntervalRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class HydrationModel(record: HydrationRecord) : IntervalRecordData {

    override val startTime: Long = record.startTime.epochSecond
    override val endTime: Long = record.endTime.epochSecond
    override val startZoneOffset: Int = record.startZoneOffset?.totalSeconds ?: 0
    override val endZoneOffset: Int = record.endZoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val volume: Volume = record.volume
}