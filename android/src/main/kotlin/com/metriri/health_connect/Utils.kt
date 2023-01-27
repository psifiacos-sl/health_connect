import android.annotation.SuppressLint
import androidx.health.connect.client.impl.converters.permission.toProtoPermission
import androidx.health.connect.client.permission.HealthPermission
import androidx.health.connect.client.records.*
import com.metriri.health_connect.Constants
import com.metriri.health_connect.models.*
import com.metriri.health_connect.models.base.RecordData

class Utils {
    companion object {

        fun fromListStringToRecordClass(list: List<String>): Set<Constants.RecordClass> {
            val result: MutableSet<Constants.RecordClass> = mutableSetOf()
            list.forEach {
                result.add(fromStringToRecordClass(it))
            }
            return result
        }

        fun fromStringToRecordClass(value: String): Constants.RecordClass {
            return Constants.RecordClass.valueOf(value)
        }

        fun fromPermissionsToRecordClasses(permissions: Set<String>): Set<Constants.RecordClass> {
            val recordClasses: MutableSet<Constants.RecordClass> = mutableSetOf()
            permissions.forEach {
//                val protoPermission = it.toProtoPermission()
//                val name = "${protoPermission.dataType.name}${
//                    when (protoPermission.accessType.number) {
//                        1 -> Constants.readSuffix
//                        else -> Constants.writeSuffix
//                    }
//                }"
                val recordClass = Constants.RecordClass.valueOf(it)
                recordClasses.add(recordClass)
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
                is BodyWaterMassRecord -> BodyWaterMassModel(record)
                is CervicalMucusRecord -> CervicalMucusModel(record)
                is CyclingPedalingCadenceRecord -> CyclingPedalingCadenceSeriesModel(record)
                is DistanceRecord -> DistanceModel(record)
                is ElevationGainedRecord -> ElevationGainedModel(record)
                is ExerciseSessionRecord -> ExerciseSessionModel(record)
                is FloorsClimbedRecord -> FloorsClimbedModel(record)
                is HeartRateRecord -> HeartRateSeriesModel(record)
                is HeightRecord -> HeightModel(record)
                is HydrationRecord -> HydrationModel(record)
                is IntermenstrualBleedingRecord -> InterMenstrualBleedingModel(record)
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