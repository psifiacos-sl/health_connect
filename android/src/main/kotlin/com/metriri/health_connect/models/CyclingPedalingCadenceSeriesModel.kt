package com.metriri.health_connect.models

import androidx.health.connect.client.records.CyclingPedalingCadenceRecord
import com.metriri.health_connect.models.base.MetaDataModel
import com.metriri.health_connect.models.base.SeriesRecordData

class CyclingPedalingCadenceSeriesModel(record: CyclingPedalingCadenceRecord) :
    SeriesRecordData<CyclingPedalingCadenceSeriesModel.Sample> {

    override val samples: List<Sample> =
        record.samples.map { v ->
            Sample(
                v.time.epochSecond,
                v.revolutionsPerMinute
            )
        }.toList()

    override val startTime: Long = record.startTime.epochSecond
    override val endTime: Long = record.endTime.epochSecond
    override val startZoneOffset: Int = record.startZoneOffset?.totalSeconds ?: 0
    override val endZoneOffset: Int = record.endZoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)

    data class Sample(val time: Long, val revolutionsPerMinute: Double)

}