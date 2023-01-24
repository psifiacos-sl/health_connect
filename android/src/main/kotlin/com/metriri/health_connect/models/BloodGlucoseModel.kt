package com.metriri.health_connect.models

import androidx.health.connect.client.records.BloodGlucoseRecord
import androidx.health.connect.client.units.BloodGlucose
import com.metriri.health_connect.models.base.InstantaneousRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class BloodGlucoseModel(record: BloodGlucoseRecord) : InstantaneousRecordData {

    override val time: Long = record.time.epochSecond
    override val zoneOffset: Int = record.zoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val level: BloodGlucose = record.level
    val specimenSource: Int = record.specimenSource
    val mealType: Int = record.mealType
    val relationToMeal: Int = record.relationToMeal
}