import 'package:health_connect/domain/record_model/_base/record.dart';

enum HealthConnectStatus {
  OK,
  UnKnown,
  ProviderNotSupported,
  ApiNotSupported,
}

enum DeviceTypes {
  UNKNOWN,
  WATCH,
  PHONE,
  SCALE,
  RING,
  HEAD_MOUNTED,
  FITNESS_BAND,
  CHEST_STRAP,
  SMART_DISPLAY
}

enum EnergyTypes { CALORIES, KILOCALORIES, JOULES, KILOJOULES }

enum BloodGlucoseTypes { MILLIMOLES_PER_LITER, MILLIGRAMS_PER_DECILITER }

enum LengthTypes { METERS, KILOMETERS, MILES, INCHES, FEET }

enum MassTypes { GRAMS, KILOGRAMS, MILLIGRAMS, MICROGRAMS, OUNCES, POUNDS }

enum PowerTypes { WATTS, KILOCALORIES_PER_DAY }

enum TemperatureTypes { CELSIUS, FAHRENHEIT }

enum VelocityTypes { METERS_PER_SECOND, KILOMETERS_PER_HOUR, MILES_PER_HOUR }

enum VolumeTypes { LITERS, MILLILITERS, FLUID_OUNCES_US }

enum MenstruationFlowTypes { FLOW_UNKNOWN, FLOW_LIGHT, FLOW_MEDIUM, FLOW_HEAVY }

enum SleepStageTypes {
  STAGE_TYPE_UNKNOWN,
  STAGE_TYPE_AWAKE,
  STAGE_TYPE_SLEEPING,
  STAGE_TYPE_OUT_OF_BED,
  STAGE_TYPE_LIGHT,
  STAGE_TYPE_DEEP,
  STAGE_TYPE_REM,
}

enum ExerciseEventType {
  EVENT_TYPE_UNKNOWN,
  EVENT_TYPE_PAUSE,
  EVENT_TYPE_REST,
}

enum RecordClass {
  ActiveCaloriesBurnedRead,
  BasalBodyTemperatureRead,
  BasalMetabolicRateRead,
  BloodGlucoseRead,
  BloodPressureRead,
  BodyFatRead,
  BodyTemperatureRead,
  BoneMassRead,
  CervicalMucusRead,
  CyclingPedalingCadenceRead,
  DistanceRead,
  ElevationGainedRead,
  ExerciseEventRead,
  ExerciseLapRead,
  ExerciseRepetitionsRead,
  ExerciseSessionRead,
  FloorsClimbedRead,
  HeartRateRead,
  HeightRead,
  HipCircumferenceRead,
  HydrationRead,
  LeanBodyMassRead,
  MenstruationFlowRead,
  NutritionRead,
  OvulationTestRead,
  OxygenSaturationRead,
  PowerRead,
  RespiratoryRateRead,
  RestingHeartRateRead,
  SexualActivityRead,
  SleepSessionRead,
  SleepStageRead,
  SpeedRead,
  StepsCadenceRead,
  StepsRead,
  SwimmingStrokesRead,
  TotalCaloriesBurnedRead,
  Vo2MaxRead,
  WaistCircumferenceRead,
  WeightRead,
  WheelchairPushesRead,
  ActiveCaloriesBurnedWrite,
  BasalBodyTemperatureWrite,
  BasalMetabolicRateWrite,
  BloodGlucoseWrite,
  BloodPressureWrite,
  BodyFatWrite,
  BodyTemperatureWrite,
  BoneMassWrite,
  CervicalMucusWrite,
  CyclingPedalingCadenceWrite,
  DistanceWrite,
  ElevationGainedWrite,
  ExerciseEventWrite,
  ExerciseLapWrite,
  ExerciseRepetitionsWrite,
  ExerciseSessionWrite,
  FloorsClimbedWrite,
  HeartRateWrite,
  HeightWrite,
  HipCircumferenceWrite,
  HydrationWrite,
  LeanBodyMassWrite,
  MenstruationFlowWrite,
  NutritionWrite,
  OvulationTestWrite,
  OxygenSaturationWrite,
  PowerWrite,
  RespiratoryRateWrite,
  RestingHeartRateWrite,
  SexualActivityWrite,
  SleepSessionWrite,
  SleepStageWrite,
  SpeedWrite,
  StepsCadenceWrite,
  StepsWrite,
  SwimmingStrokesWrite,
  TotalCaloriesBurnedWrite,
  Vo2MaxWrite,
  WaistCircumferenceWrite,
  WeightWrite,
  WheelchairPushesWrite,
}
