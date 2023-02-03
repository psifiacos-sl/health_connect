import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.*
import com.metriri.health_connect.Constants
import com.metriri.health_connect.models.*
import com.metriri.health_connect.models.base.RecordData

class Utils {
    companion object {

        fun fromPermissionsToRecordClasses(permissions: Set<String>): Set<Constants.RecordClass> {
            val recordClasses: MutableSet<Constants.RecordClass> = mutableSetOf()
            permissions.forEach {
                Constants.RecordClass.values()
                    .first { r -> Constants.permissionPrefix + r.permission == it }.let { rc ->
                        recordClasses.add(rc)
                    }
            }
            return recordClasses
        }

        fun fromRecordClassesToPermissions(recordsClasses: List<String>): Set<String> {
            val permissions: MutableSet<String> = mutableSetOf()
            recordsClasses.forEach { str ->
                Constants.RecordClass.valueOf(str).kC.also { kClass ->
                    when (str.endsWith(Constants.readSuffix)) {
                        true -> permissions.add(HealthPermission.getReadPermission(kClass))
                        else -> permissions.add(HealthPermission.getWritePermission(kClass))
                    }
                }
            }
            return permissions
        }

        internal fun fromRecordKClassToModel(record: Record): RecordData? {
            val result = when (record) {
                is ActiveCaloriesBurnedRecord -> ActiveCaloriesBurnedModel(record)
                is BasalBodyTemperatureRecord -> BasalBodyTemperatureModel(record)
                is BasalMetabolicRateRecord -> BasalMetabolicRateModel(record)
                is BloodGlucoseRecord -> BloodGlucoseModel(record)
                is BloodPressureRecord -> BloodPressureModel(record)
                is BodyFatRecord -> BodyFatModel(record)
                is BodyTemperatureRecord -> BodyTemperatureModel(record)
                is BoneMassRecord -> BoneMassModel(record)
                is BodyWaterMassRecord -> BodyWaterMassModel(record)
                is CervicalMucusRecord -> CervicalMucusModel(record)
                is CyclingPedalingCadenceRecord -> CyclingPedalingCadenceSeriesModel(record)
                is DistanceRecord -> DistanceModel(record)
                is ElevationGainedRecord -> ElevationGainedModel(record)
                is ExerciseSessionRecord -> ExerciseSessionModel(record)
                is FloorsClimbedRecord -> FloorsClimbedModel(record)
                is HeartRateRecord -> HeartRateSeriesModel(record)
                is HeartRateVariabilityRmssdRecord -> HeartRateVariabilityRmssdModel(record)
                is HeightRecord -> HeightModel(record)
                is HydrationRecord -> HydrationModel(record)
                is LeanBodyMassRecord -> LeanBodyMassModel(record)
                is MenstruationFlowRecord -> MenstruationFlowModel(record)
                is MenstruationPeriodRecord -> MenstruationPeriodModel(record)
                is NutritionRecord -> NutritionModel(record)
                is OvulationTestRecord -> OvulationTestModel(record)
                is OxygenSaturationRecord -> OxygenSaturationModel(record)
                is PowerRecord -> PowerModel(record)
                is RespiratoryRateRecord -> RespiratoryRateModel(record)
                is RestingHeartRateRecord -> RestingHeartRateModel(record)
                is SexualActivityRecord -> SexualActivityModel(record)
                is SleepSessionRecord -> SleepSessionModel(record)
                is SleepStageRecord -> SleepStageModel(record)
                is SpeedRecord -> SpeedSeriesModel(record)
                is StepsCadenceRecord -> StepsCadenceModel(record)
                is StepsRecord -> StepsModel(record)
                is TotalCaloriesBurnedRecord -> TotalCaloriesBurnedModel(record)
                is Vo2MaxRecord -> Vo2MaxModel(record)
                is WeightRecord -> WeightModel(record)
                is WheelchairPushesRecord -> WheelchairPushesModel(record)
                else -> null
            }
            return result
        }

    }


}