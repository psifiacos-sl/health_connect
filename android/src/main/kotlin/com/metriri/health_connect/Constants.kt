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
        val readSuffix = "Read"
        val writeSuffix = "Write"
        val permissionPrefix = "android.permission.health."
    }

    enum class hCClientStatus {
        OK, UnKnown, ProviderNotAvailable, ApiNotSupported,
    }

    enum class RecordClass(val kC: KClass<out Record>, val permission: String) {
        ActiveCaloriesBurnedRead(ActiveCaloriesBurnedRecord::class, "READ_ACTIVE_CALORIES_BURNED"),
        BasalBodyTemperatureRead(BasalBodyTemperatureRecord::class, "READ_BASAL_BODY_TEMPERATURE"),
        BasalMetabolicRateRead(BasalMetabolicRateRecord::class, "READ_BASAL_METABOLIC_RATE"),
        BloodGlucoseRead(BloodGlucoseRecord::class, "READ_BLOOD_GLUCOSE"),
        BloodPressureRead(BloodPressureRecord::class, "READ_BLOOD_PRESSURE"),
        BodyFatRead(BodyFatRecord::class, "READ_BODY_FAT"),
        BodyTemperatureRead(BodyTemperatureRecord::class, "READ_BODY_TEMPERATURE"),
        BoneMassRead(BoneMassRecord::class, "READ_BONE_MASS"),
        CervicalMucusRead(CervicalMucusRecord::class, "READ_CERVICAL_MUCUS"),
        CyclingPedalingCadenceSeriesRead(CyclingPedalingCadenceRecord::class, "READ_EXERCISE"),
        DistanceRead(DistanceRecord::class, "READ_DISTANCE"),
        ElevationGainedRead(ElevationGainedRecord::class, "READ_ELEVATION_GAINED"),
        ExerciseSessionRead(ExerciseSessionRecord::class, "READ_EXERCISE"),
        FloorsClimbedRead(FloorsClimbedRecord::class, "READ_FLOORS_CLIMBED"),
        HeartRateSeriesRead(HeartRateRecord::class, "READ_HEART_RATE"),
        HeightRead(HeightRecord::class, "READ_HEIGHT"),
        HydrationRead(HydrationRecord::class, "READ_HYDRATION"),
        LeanBodyMassRead(LeanBodyMassRecord::class, "READ_LEAN_BODY_MASS"),
        MenstruationFlowRead(MenstruationFlowRecord::class, "READ_MENSTRUATION"),
        MenstruationPeriodRead(MenstruationPeriodRecord::class, "READ_MENSTRUATION"),
        NutritionRead(NutritionRecord::class, "READ_NUTRITION"),
        OvulationTestRead(OvulationTestRecord::class, "READ_OVULATION_TEST"),
        OxygenSaturationRead(OxygenSaturationRecord::class, "READ_OXYGEN_SATURATION"),
        PowerSeriesRead(PowerRecord::class, "READ_POWER"),
        RespiratoryRateRead(RespiratoryRateRecord::class, "READ_RESPIRATORY_RATE"),
        RestingHeartRateRead(RestingHeartRateRecord::class, "READ_RESTING_HEART_RATE"),
        SexualActivityRead(SexualActivityRecord::class, "READ_SEXUAL_ACTIVITY"),
        SleepSessionRead(SleepSessionRecord::class, "READ_SLEEP"),
        SleepStageRead(SleepStageRecord::class, "READ_SLEEP"),
        SpeedSeriesRead(SpeedRecord::class, "READ_SPEED"),
        StepsCadenceSeriesRead(StepsCadenceRecord::class, "READ_STEPS"),
        StepsRead(StepsRecord::class, "READ_STEPS"),
        TotalCaloriesBurnedRead(TotalCaloriesBurnedRecord::class, "READ_TOTAL_CALORIES_BURNED"),
        Vo2MaxRead(Vo2MaxRecord::class, "READ_VO2_MAX"),
        WeightRead(WeightRecord::class, "READ_WEIGHT"),
        WheelchairPushesRead(WheelchairPushesRecord::class, "READ_WHEELCHAIR_PUSHES"),


        ActiveCaloriesBurnedWrite(ActiveCaloriesBurnedRecord::class, "WRITE_ACTIVE_CALORIES_BURNED"),
        BasalBodyTemperatureWrite(BasalBodyTemperatureRecord::class, "WRITE_BASAL_BODY_TEMPERATURE"),
        BasalMetabolicRateWrite(BasalMetabolicRateRecord::class, "WRITE_BASAL_METABOLIC_RATE"),
        BloodGlucoseWrite(BloodGlucoseRecord::class, "WRITE_BLOOD_GLUCOSE"),
        BloodPressureWrite(BloodPressureRecord::class, "WRITE_BLOOD_PRESSURE"),
        BodyFatWrite(BodyFatRecord::class, "WRITE_BODY_FAT"),
        BodyTemperatureWrite(BodyTemperatureRecord::class, "WRITE_BODY_TEMPERATURE"),
        BoneMassWrite(BoneMassRecord::class, "WRITE_BONE_MASS"),
        CervicalMucusWrite(CervicalMucusRecord::class, "WRITE_CERVICAL_MUCUS"),
        CyclingPedalingCadenceSeriesWrite(CyclingPedalingCadenceRecord::class, "WRITE_EXERCISE"),
        DistanceWrite(DistanceRecord::class, "WRITE_DISTANCE"),
        ElevationGainedWrite(ElevationGainedRecord::class, "WRITE_ELEVATION_GAINED"),
        ExerciseSessionWrite(ExerciseSessionRecord::class, "WRITE_EXERCISE"),
        FloorsClimbedWrite(FloorsClimbedRecord::class, "WRITE_FLOORS_CLIMBED"),
        HeartRateSeriesWrite(HeartRateRecord::class, "WRITE_HEART_RATE"),
        HeightWrite(HeightRecord::class, "WRITE_HEIGHT"),
        HydrationWrite(HydrationRecord::class, "WRITE_HYDRATION"),
        LeanBodyMassWrite(LeanBodyMassRecord::class, "WRITE_LEAN_BODY_MASS"),
        MenstruationFlowWrite(MenstruationFlowRecord::class, "WRITE_MENSTRUATION"),
        MenstruationPeriodWrite(MenstruationPeriodRecord::class, "WRITE_MENSTRUATION"),
        NutritionWrite(NutritionRecord::class, "WRITE_NUTRITION"),
        OvulationTestWrite(OvulationTestRecord::class, "WRITE_OVULATION_TEST"),
        OxygenSaturationWrite(OxygenSaturationRecord::class, "WRITE_OXYGEN_SATURATION"),
        PowerSeriesWrite(PowerRecord::class, "WRITE_POWER"),
        RespiratoryRateWrite(RespiratoryRateRecord::class, "WRITE_RESPIRATORY_RATE"),
        RestingHeartRateWrite(RestingHeartRateRecord::class, "WRITE_RESTING_HEART_RATE"),
        SexualActivityWrite(SexualActivityRecord::class, "WRITE_SEXUAL_ACTIVITY"),
        SleepSessionWrite(SleepSessionRecord::class, "WRITE_SLEEP"),
        SleepStageWrite(SleepStageRecord::class, "WRITE_SLEEP"),
        SpeedSeriesWrite(SpeedRecord::class, "WRITE_SPEED"),
        StepsCadenceSeriesWrite(StepsCadenceRecord::class, "WRITE_STEPS"),
        StepsWrite(StepsRecord::class, "WRITE_STEPS"),
        TotalCaloriesBurnedWrite(TotalCaloriesBurnedRecord::class, "WRITE_TOTAL_CALORIES_BURNED"),
        Vo2MaxWrite(Vo2MaxRecord::class, "WRITE_VO2_MAX"),
        WeightWrite(WeightRecord::class, "WRITE_WEIGHT"),
        WheelchairPushesWrite(WheelchairPushesRecord::class, "WRITE_WHEELCHAIR_PUSHES"),
    }
}