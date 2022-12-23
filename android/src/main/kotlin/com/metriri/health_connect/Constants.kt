package com.metriri.health_connect

class Constants {
    companion object {
        val android = "Android"
        val methodChannelToAndroid = "health_connect_to_android"
        val methodChannelToFlutter = "health_connect_to_flutter"

        ///Methods name
        val getPlatformVersion = "getPlatformVersion"
        val requestPermissions = "requestPermissions"
        val isAuthorized = "isAuthorized"
        val readData = "readData"

        ///Keys
    }

    enum class HealthConnectClientStatus{
        OK,
        UnKnown,
        ProviderNotSupported,
        ApiNotSupported,
    }

    enum class RecordClass{
        ActiveCaloriesBurnedRecord,
        BasalBodyTemperatureRecord,
        BasalMetabolicRateRecord,
        BloodGlucoseRecord,
        BloodPressureRecord,
        BodyFatRecord,
        BodyTemperatureRecord,
        BodyWaterMassRecord,
        BoneMassRecord,
        DistanceRecord,
        ElevationGainedRecord,
        ExerciseEventRecord,
        ExerciseLapRecord,
        ExerciseRepetitionsRecord,
        ExerciseSessionRecord,
        FloorsClimbedRecord,
        HeartRateRecord,
        HeartRateVariabilityRmssdRecord,
        HeightRecord,
        LeanBodyMassRecord,
        MenstruationFlowRecord,
        OxygenSaturationRecord,
        RespiratoryRateRecord,
        RestingHeartRateRecord,
        SleepSessionRecord,
        SleepStageRecord,
        SpeedRecord,
        StepsCadenceRecord,
        StepsRecord,
        TotalCaloriesBurnedRecord,
        Vo2MaxRecord,
        WeightRecord,
        WheelchairPushesRecord,

        CervicalMucusRecord,
        CyclingPedalingCadenceRecord,
        HydrationRecord,
        NutritionRecord,
        OvulationTestRecord,
        PowerRecord,
        SexualActivityRecord,
        SwimmingStrokesRecord,
    }
}