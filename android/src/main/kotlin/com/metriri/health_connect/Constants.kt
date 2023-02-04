package com.metriri.health_connect

import androidx.health.connect.client.records.*
import kotlin.reflect.KClass

class Constants {
    companion object {
        val android = "Android"
        val methodChannelToAndroid = "health_connect_to_android"

        ///Methods name
        val getPlatformVersion = "getPlatformVersion"
        val isProviderAvailable = "isProviderAvailable"
        val requestPermissions = "requestPermissions"
        val checkPermissions = "checkPermissions"
        val registerPermissionsOberver = "registerPermissionsOberver"
        val readData = "readData"
        val writeData = "writeData"

        ///Keys
        val missingActivity = "missingActivity"
        val missingArgument = "missingArgument"
        val recordClassListArgKey = "recordClassListArgKey"
        val recordClassArgKey = "recordClassArgKey"
        val startTime = "startTime"
        val endTime = "endTime"
        val readPrefix = "READ"
        val writeSuffix = "Write"
        val permissionPrefix = "android.permission.health."
    }

    enum class hCClientStatus {
        OK, UnKnown, ProviderNotAvailable, ApiNotSupported,
    }

    enum class HCPermission {
        READ_ACTIVE_CALORIES_BURNED,
        READ_BASAL_BODY_TEMPERATURE,
        READ_BASAL_METABOLIC_RATE,
        READ_BLOOD_GLUCOSE,
        READ_BLOOD_PRESSURE,
        READ_BODY_FAT,
        READ_BODY_TEMPERATURE,
        READ_BODY_WATER_MASS,
        READ_BONE_MASS,
        READ_CERVICAL_MUCUS,
        READ_EXERCISE,
        READ_DISTANCE,
        READ_ELEVATION_GAINED,
        READ_FLOORS_CLIMBED,
        READ_HEART_RATE,
        READ_HEART_RATE_VARIABILITY,
        READ_HEIGHT,
        READ_HYDRATION,
        READ_LEAN_BODY_MASS,
        READ_MENSTRUATION,
        READ_NUTRITION,
        READ_OVULATION_TEST,
        READ_OXYGEN_SATURATION,
        READ_POWER,
        READ_RESPIRATORY_RATE,
        READ_RESTING_HEART_RATE,
        READ_SEXUAL_ACTIVITY,
        READ_SLEEP,
        READ_SPEED,
        READ_STEPS,
        READ_TOTAL_CALORIES_BURNED,
        READ_VO2_MAX,
        READ_WEIGHT,
        READ_WHEELCHAIR_PUSHES,

        WRITE_ACTIVE_CALORIES_BURNED,
        WRITE_BASAL_BODY_TEMPERATURE,
        WRITE_BASAL_METABOLIC_RATE,
        WRITE_BLOOD_GLUCOSE,
        WRITE_BLOOD_PRESSURE,
        WRITE_BODY_FAT,
        WRITE_BODY_TEMPERATURE,
        WRITE_BODY_WATER_MASS,
        WRITE_BONE_MASS,
        WRITE_CERVICAL_MUCUS,
        WRITE_EXERCISE,
        WRITE_DISTANCE,
        WRITE_ELEVATION_GAINED,
        WRITE_FLOORS_CLIMBED,
        WRITE_HEART_RATE,
        WRITE_HEART_RATE_VARIABILITY,
        WRITE_HEIGHT,
        WRITE_HYDRATION,
        WRITE_LEAN_BODY_MASS,
        WRITE_MENSTRUATION,
        WRITE_NUTRITION,
        WRITE_OVULATION_TEST,
        WRITE_OXYGEN_SATURATION,
        WRITE_POWER,
        WRITE_RESPIRATORY_RATE,
        WRITE_RESTING_HEART_RATE,
        WRITE_SEXUAL_ACTIVITY,
        WRITE_SLEEP,
        WRITE_SPEED,
        WRITE_STEPS,
        WRITE_TOTAL_CALORIES_BURNED,
        WRITE_VO2_MAX,
        WRITE_WEIGHT,
        WRITE_WHEELCHAIR_PUSHES
    }

    enum class RecordClass(val kC: KClass<out Record>) {
        ActiveCaloriesBurnedRead(ActiveCaloriesBurnedRecord::class),
        BasalBodyTemperatureRead(BasalBodyTemperatureRecord::class),
        BasalMetabolicRateRead(BasalMetabolicRateRecord::class),
        BloodGlucoseRead(BloodGlucoseRecord::class),
        BloodPressureRead(BloodPressureRecord::class),
        BodyFatRead(BodyFatRecord::class),
        BodyTemperatureRead(BodyTemperatureRecord::class),
        BodyWaterMassRead(BodyWaterMassRecord::class),
        BoneMassRead(BoneMassRecord::class),
        CervicalMucusRead(CervicalMucusRecord::class),
        CyclingPedalingCadenceSeriesRead(CyclingPedalingCadenceRecord::class),
        DistanceRead(DistanceRecord::class),
        ElevationGainedRead(ElevationGainedRecord::class),
        ExerciseSessionRead(ExerciseSessionRecord::class),
        FloorsClimbedRead(FloorsClimbedRecord::class),
        HeartRateSeriesRead(HeartRateRecord::class),
        HeartRateVariabilityRmssdRead(HeartRateRecord::class),
        HeightRead(HeightRecord::class),
        HydrationRead(HydrationRecord::class),
        LeanBodyMassRead(LeanBodyMassRecord::class),
        MenstruationFlowRead(MenstruationFlowRecord::class),
        MenstruationPeriodRead(MenstruationPeriodRecord::class),
        NutritionRead(NutritionRecord::class),
        OvulationTestRead(OvulationTestRecord::class),
        OxygenSaturationRead(OxygenSaturationRecord::class),
        PowerSeriesRead(PowerRecord::class),
        RespiratoryRateRead(RespiratoryRateRecord::class),
        RestingHeartRateRead(RestingHeartRateRecord::class),
        SexualActivityRead(SexualActivityRecord::class),
        SleepSessionRead(SleepSessionRecord::class),
        SleepStageRead(SleepStageRecord::class),
        SpeedSeriesRead(SpeedRecord::class),
        StepsCadenceSeriesRead(StepsCadenceRecord::class),
        StepsRead(StepsRecord::class),
        TotalCaloriesBurnedRead(TotalCaloriesBurnedRecord::class),
        Vo2MaxRead(Vo2MaxRecord::class),
        WeightRead(WeightRecord::class),
        WheelchairPushesRead(WheelchairPushesRecord::class),

        ActiveCaloriesBurnedWrite(ActiveCaloriesBurnedRecord::class),
        BasalBodyTemperatureWrite(BasalBodyTemperatureRecord::class),
        BasalMetabolicRateWrite(BasalMetabolicRateRecord::class),
        BloodGlucoseWrite(BloodGlucoseRecord::class),
        BloodPressureWrite(BloodPressureRecord::class),
        BodyFatWrite(BodyFatRecord::class),
        BodyTemperatureWrite(BodyTemperatureRecord::class),
        BodyWaterMassWrite(BodyWaterMassRecord::class),
        BoneMassWrite(BoneMassRecord::class),
        CervicalMucusWrite(CervicalMucusRecord::class),
        CyclingPedalingCadenceSeriesWrite(CyclingPedalingCadenceRecord::class),
        DistanceWrite(DistanceRecord::class),
        ElevationGainedWrite(ElevationGainedRecord::class),
        ExerciseSessionWrite(ExerciseSessionRecord::class),
        FloorsClimbedWrite(FloorsClimbedRecord::class),
        HeartRateSeriesWrite(HeartRateRecord::class),
        HeartRateVariabilityRmssdWrite(HeartRateRecord::class),
        HeightWrite(HeightRecord::class),
        HydrationWrite(HydrationRecord::class),
        LeanBodyMassWrite(LeanBodyMassRecord::class),
        MenstruationFlowWrite(MenstruationFlowRecord::class),
        MenstruationPeriodWrite(MenstruationPeriodRecord::class),
        NutritionWrite(NutritionRecord::class),
        OvulationTestWrite(OvulationTestRecord::class),
        OxygenSaturationWrite(OxygenSaturationRecord::class),
        PowerSeriesWrite(PowerRecord::class),
        RespiratoryRateWrite(RespiratoryRateRecord::class),
        RestingHeartRateWrite(RestingHeartRateRecord::class),
        SexualActivityWrite(SexualActivityRecord::class),
        SleepSessionWrite(SleepSessionRecord::class),
        SleepStageWrite(SleepStageRecord::class),
        SpeedSeriesWrite(SpeedRecord::class),
        StepsCadenceSeriesWrite(StepsCadenceRecord::class),
        StepsWrite(StepsRecord::class),
        TotalCaloriesBurnedWrite(TotalCaloriesBurnedRecord::class),
        Vo2MaxWrite(Vo2MaxRecord::class),
        WeightWrite(WeightRecord::class),
        WheelchairPushesWrite(WheelchairPushesRecord::class),
    }
}