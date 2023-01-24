package com.metriri.health_connect.models

import androidx.health.connect.client.records.ExerciseEventRecord
import com.metriri.health_connect.models.base.IntervalRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class ExerciseEventModel(record: ExerciseEventRecord) : IntervalRecordData {

    override val startTime: Long = record.startTime.epochSecond
    override val endTime: Long = record.endTime.epochSecond
    override val startZoneOffset: Int = record.startZoneOffset?.totalSeconds ?: 0
    override val endZoneOffset: Int = record.endZoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val eventType: Int = record.eventType
}