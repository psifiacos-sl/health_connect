package com.metriri.health_connect.models

import androidx.health.connect.client.records.BloodPressureRecord
import androidx.health.connect.client.units.Pressure
import com.metriri.health_connect.models.base.InstantaneousRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class BloodPressureModel(record: BloodPressureRecord) : InstantaneousRecordData {

    override val time: Long = record.time.epochSecond
    override val zoneOffset: Int = record.zoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val systolic: Pressure = record.systolic
    val diastolic: Pressure = record.diastolic
    val bodyPosition: Int = record.bodyPosition
    val measurementLocation: Int = record.measurementLocation
}