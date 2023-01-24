package com.metriri.health_connect.models

import androidx.health.connect.client.records.NutritionRecord
import androidx.health.connect.client.units.Energy
import androidx.health.connect.client.units.Mass
import com.metriri.health_connect.models.base.IntervalRecordData
import com.metriri.health_connect.models.base.MetaDataModel

class NutritionModel(record: NutritionRecord) : IntervalRecordData {

    override val startTime: Long = record.startTime.epochSecond
    override val endTime: Long = record.endTime.epochSecond
    override val startZoneOffset: Int = record.startZoneOffset?.totalSeconds ?: 0
    override val endZoneOffset: Int = record.endZoneOffset?.totalSeconds ?: 0
    override val metadata: MetaDataModel = MetaDataModel.setDataFromRecord(record)
    val biotin: Mass? = record.biotin
    val caffeine: Mass? = record.caffeine
    val calcium: Mass? = record.calcium
    val energy: Energy? = record.energy
    val energyFromFat: Energy? = record.energyFromFat
    val chloride: Mass? = record.chloride
    val cholesterol: Mass? = record.cholesterol
    val chromium: Mass? = record.chromium
    val copper: Mass? = record.copper
    val dietaryFiber: Mass? = record.dietaryFiber
    val folate: Mass? = record.folate
    val folicAcid: Mass? = record.folicAcid
    val iodine: Mass? = record.iodine
    val iron: Mass? = record.iron
    val magnesium: Mass? = record.magnesium
    val manganese: Mass? = record.manganese
    val molybdenum: Mass? = record.molybdenum
    val monounsaturatedFat: Mass? = record.monounsaturatedFat
    val niacin: Mass? = record.niacin
    val pantothenicAcid: Mass? = record.pantothenicAcid
    val phosphorus: Mass? = record.phosphorus
    val polyunsaturatedFat: Mass? = record.polyunsaturatedFat
    val potassium: Mass? = record.potassium
    val protein: Mass? = record.protein
    val riboflavin: Mass? = record.riboflavin
    val saturatedFat: Mass? = record.saturatedFat
    val selenium: Mass? = record.selenium
    val sodium: Mass? = record.sodium
    val sugar: Mass? = record.sugar
    val thiamin: Mass? = record.thiamin
    val totalCarbohydrate: Mass? = record.totalCarbohydrate
    val totalFat: Mass? = record.totalFat
    val transFat: Mass? = record.transFat
    val unsaturatedFat: Mass? = record.unsaturatedFat
    val vitaminA: Mass? = record.vitaminA
    val vitaminB12: Mass? = record.vitaminB12
    val vitaminB6: Mass? = record.vitaminB6
    val vitaminC: Mass? = record.vitaminC
    val vitaminD: Mass? = record.vitaminD
    val vitaminE: Mass? = record.vitaminE
    val vitaminK: Mass? = record.vitaminK
    val zinc: Mass? = record.zinc
    val name: String? = record.name
    val mealType: Int = record.mealType
}