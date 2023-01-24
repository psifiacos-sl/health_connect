package com.metriri.health_connect.models

import androidx.health.connect.client.records.RestingHeartRateRecord
import com.metriri.health_connect.models.base.InstantaneousRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class RestingHeartRateModel(record: RestingHeartRateRecord) : InstantaneousRecordData {

    override val time: Long = record.time.epochSecond
    override val zoneOffset: Int = record.zoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val beatsPerMinute: Long = record.beatsPerMinute
}