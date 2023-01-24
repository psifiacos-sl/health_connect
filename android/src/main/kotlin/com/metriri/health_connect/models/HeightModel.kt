package com.metriri.health_connect.models

import androidx.health.connect.client.records.HeightRecord
import androidx.health.connect.client.units.Length
import com.metriri.health_connect.models.base.InstantaneousRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class HeightModel(record: HeightRecord) : InstantaneousRecordData {

    override val time: Long = record.time.epochSecond
    override val zoneOffset: Int = record.zoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val height: Length = record.height
}