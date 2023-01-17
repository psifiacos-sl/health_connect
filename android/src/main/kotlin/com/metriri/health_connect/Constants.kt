package com.metriri.health_connect

import androidx.health.connect.client.permission.AccessTypes
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
    }

    enum class hCClientStatus {
        OK,
        UnKnown,
        ProviderNotAvailable,
        ApiNotSupported,
    }

    enum class RecordClass(val kC: KClass<out Record>) {
        ActiveCaloriesBurnedRead(ActiveCaloriesBurnedRecord::class),
        ActivityEventRead(ExerciseEventRecord::class),
        ActivityLapRead(ExerciseLapRecord::class),
        ActivitySessionRead(ExerciseSessionRecord::class),
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
        FloorsClimbedRead(FloorsClimbedRecord::class),
        HeartRateSeriesRead(HeartRateRecord::class),
        HeartRateVariabilityRmssdRead(HeartRateVariabilityRmssdRecord::class),
        HeightRead(HeightRecord::class),
        HydrationRead(HydrationRecord::class),
        LeanBodyMassRead(LeanBodyMassRecord::class),
        MenstruationRead(MenstruationFlowRecord::class),
        NutritionRead(NutritionRecord::class),
        OvulationTestRead(OvulationTestRecord::class),
        OxygenSaturationRead(OxygenSaturationRecord::class),
        PowerSeriesRead(PowerRecord::class),
        RepetitionsRead(ExerciseRepetitionsRecord::class),
        RespiratoryRateRead(RespiratoryRateRecord::class),
        RestingHeartRateRead(RestingHeartRateRecord::class),
        SexualActivityRead(SexualActivityRecord::class),
        SleepSessionRead(SleepSessionRecord::class),
        SleepStageRead(SleepStageRecord::class),
        SpeedSeriesRead(SpeedRecord::class),
        StepsRead(StepsRecord::class),
        StepsCadenceSeriesRead(StepsCadenceRecord::class),
        SwimmingStrokesRead(SwimmingStrokesRecord::class),
        TotalCaloriesBurnedRead(TotalCaloriesBurnedRecord::class),
        Vo2MaxRead(Vo2MaxRecord::class),
        WheelchairPushesRead(WheelchairPushesRecord::class),
        WeightRead(WeightRecord::class),

        ActiveCaloriesBurnedWrite(ActiveCaloriesBurnedRecord::class),
        ActivityEventWrite(ExerciseEventRecord::class),
        ActivityLapWrite(ExerciseLapRecord::class),
        ActivitySessionWrite(ExerciseSessionRecord::class),
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
        FloorsClimbedWrite(FloorsClimbedRecord::class),
        HeartRateSeriesWrite(HeartRateRecord::class),
        HeartRateVariabilityRmssdWrite(HeartRateVariabilityRmssdRecord::class),
        HeightWrite(HeightRecord::class),
        HydrationWrite(HydrationRecord::class),
        LeanBodyMassWrite(LeanBodyMassRecord::class),
        MenstruationWrite(MenstruationFlowRecord::class),
        NutritionWrite(NutritionRecord::class),
        OvulationTestWrite(OvulationTestRecord::class),
        OxygenSaturationWrite(OxygenSaturationRecord::class),
        PowerSeriesWrite(PowerRecord::class),
        RepetitionsWrite(ExerciseRepetitionsRecord::class),
        RespiratoryRateWrite(RespiratoryRateRecord::class),
        RestingHeartRateWrite(RestingHeartRateRecord::class),
        SexualActivityWrite(SexualActivityRecord::class),
        SleepSessionWrite(SleepSessionRecord::class),
        SleepStageWrite(SleepStageRecord::class),
        SpeedSeriesWrite(SpeedRecord::class),
        StepsWrite(StepsRecord::class),
        StepsCadenceSeriesWrite(StepsCadenceRecord::class),
        SwimmingStrokesWrite(SwimmingStrokesRecord::class),
        TotalCaloriesBurnedWrite(TotalCaloriesBurnedRecord::class),
        Vo2MaxWrite(Vo2MaxRecord::class),
        WheelchairPushesWrite(WheelchairPushesRecord::class),
        WeightWrite(WeightRecord::class),

    }
}