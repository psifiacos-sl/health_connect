package com.metriri.health_connect.models

import androidx.health.connect.client.records.BodyTemperatureRecord
import androidx.health.connect.client.units.Temperature
import com.metriri.health_connect.models.base.InstantaneousRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class BodyTemperatureModel(record: BodyTemperatureRecord) : InstantaneousRecordData {

    override val time: Long = record.time.epochSecond
    override val zoneOffset: Int = record.zoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val temperature: Temperature = record.temperature
    val measurementLocation: Int = record.measurementLocation
}