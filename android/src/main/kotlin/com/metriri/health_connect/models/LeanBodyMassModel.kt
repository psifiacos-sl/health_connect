package com.metriri.health_connect.models

import androidx.health.connect.client.records.LeanBodyMassRecord
import androidx.health.connect.client.units.Mass
import com.metriri.health_connect.models.base.InstantaneousRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class LeanBodyMassModel(record: LeanBodyMassRecord) : InstantaneousRecordData {

    override val time: Long = record.time.epochSecond
    override val zoneOffset: Int = record.zoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val mass: Mass = record.mass
}