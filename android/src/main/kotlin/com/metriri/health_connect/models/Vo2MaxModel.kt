package com.metriri.health_connect.models

import androidx.health.connect.client.records.Vo2MaxRecord
import com.metriri.health_connect.models.base.InstantaneousRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class Vo2MaxModel(record: Vo2MaxRecord) : InstantaneousRecordData {

    override val time: Long = record.time.epochSecond
    override val zoneOffset: Int = record.zoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val vo2MillilitersPerMinuteKilogram: Double = record.vo2MillilitersPerMinuteKilogram
}