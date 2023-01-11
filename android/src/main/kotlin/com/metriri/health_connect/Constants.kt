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
        BasalBodyTemperatureRead(BasalBodyTemperatureRecord::class),
        BasalMetabolicRateRead(BasalMetabolicRateRecord::class),
        BloodGlucoseRead(BloodGlucoseRecord::class),
        BloodPressureRead(BloodPressureRecord::class),
        BodyFatRead(BodyFatRecord::class),
        BodyTemperatureRead(BodyTemperatureRecord::class),
        BoneMassRead(BoneMassRecord::class),
        CervicalMucusRead(CervicalMucusRecord::class),
        CyclingPedalingCadenceRead(CyclingPedalingCadenceRecord::class),
        DistanceRead(DistanceRecord::class),
        ElevationGainedRead(ElevationGainedRecord::class),
        ExerciseEventRead(ExerciseEventRecord::class),
        ExerciseLapRead(ExerciseLapRecord::class),
        ExerciseRepetitionsRead(ExerciseRepetitionsRecord::class),
        ExerciseSessionRead(ExerciseSessionRecord::class),
        FloorsClimbedRead(FloorsClimbedRecord::class),
        HeartRateRead(HeartRateRecord::class),
        HeightRead(HeightRecord::class),
        HipCircumferenceRead(HipCircumferenceRecord::class),
        HydrationRead(HydrationRecord::class),
        LeanBodyMassRead(LeanBodyMassRecord::class),
        MenstruationFlowRead(MenstruationFlowRecord::class),
        NutritionRead(NutritionRecord::class),
        OvulationTestRead(OvulationTestRecord::class),
        OxygenSaturationRead(OxygenSaturationRecord::class),
        PowerRead(PowerRecord::class),
        RespiratoryRateRead(RespiratoryRateRecord::class),
        RestingHeartRateRead(RestingHeartRateRecord::class),
        SexualActivityRead(SexualActivityRecord::class),
        SleepSessionRead(SleepSessionRecord::class),
        SleepStageRead(SleepStageRecord::class),
        SpeedRead(SpeedRecord::class),
        StepsCadenceRead(StepsCadenceRecord::class),
        StepsRead(StepsRecord::class),
        SwimmingStrokesRead(SwimmingStrokesRecord::class),
        TotalCaloriesBurnedRead(TotalCaloriesBurnedRecord::class),
        Vo2MaxRead(Vo2MaxRecord::class),
        WaistCircumferenceRead(WaistCircumferenceRecord::class),
        WeightRead(WeightRecord::class),
        WheelchairPushesRead(WheelchairPushesRecord::class),

        ActiveCaloriesBurnedWrite(ActiveCaloriesBurnedRecord::class),
        BasalBodyTemperatureWrite(BasalBodyTemperatureRecord::class),
        BasalMetabolicRateWrite(BasalMetabolicRateRecord::class),
        BloodGlucoseWrite(BloodGlucoseRecord::class),
        BloodPressureWrite(BloodPressureRecord::class),
        BodyFatWrite(BodyFatRecord::class),
        BodyTemperatureWrite(BodyTemperatureRecord::class),
        BoneMassWrite(BoneMassRecord::class),
        CervicalMucusWrite(CervicalMucusRecord::class),
        CyclingPedalingCadenceWrite(CyclingPedalingCadenceRecord::class),
        DistanceWrite(DistanceRecord::class),
        ElevationGainedWrite(ElevationGainedRecord::class),
        ExerciseEventWrite(ExerciseEventRecord::class),
        ExerciseLapWrite(ExerciseLapRecord::class),
        ExerciseRepetitionsWrite(ExerciseRepetitionsRecord::class),
        ExerciseSessionWrite(ExerciseSessionRecord::class),
        FloorsClimbedWrite(FloorsClimbedRecord::class),
        HeartRateWrite(HeartRateRecord::class),
        HeightWrite(HeightRecord::class),
        HipCircumferenceWrite(HipCircumferenceRecord::class),
        HydrationWrite(HydrationRecord::class),
        LeanBodyMassWrite(LeanBodyMassRecord::class),
        MenstruationFlowWrite(MenstruationFlowRecord::class),
        NutritionWrite(NutritionRecord::class),
        OvulationTestWrite(OvulationTestRecord::class),
        OxygenSaturationWrite(OxygenSaturationRecord::class),
        PowerWrite(PowerRecord::class),
        RespiratoryRateWrite(RespiratoryRateRecord::class),
        RestingHeartRateWrite(RestingHeartRateRecord::class),
        SexualActivityWrite(SexualActivityRecord::class),
        SleepSessionWrite(SleepSessionRecord::class),
        SleepStageWrite(SleepStageRecord::class),
        SpeedWrite(SpeedRecord::class),
        StepsCadenceWrite(StepsCadenceRecord::class),
        StepsWrite(StepsRecord::class),
        SwimmingStrokesWrite(SwimmingStrokesRecord::class),
        TotalCaloriesBurnedWrite(TotalCaloriesBurnedRecord::class),
        Vo2MaxWrite(Vo2MaxRecord::class),
        WaistCircumferenceWrite(WaistCircumferenceRecord::class),
        WeightWrite(WeightRecord::class),
        WheelchairPushesWrite(WheelchairPushesRecord::class),

    }
}