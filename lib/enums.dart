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

enum ExerciseType {
  EXERCISE_TYPE_BACK_EXTENSION,
  EXERCISE_TYPE_BADMINTON,
  EXERCISE_TYPE_BARBELL_SHOULDER_PRESS,
  EXERCISE_TYPE_BASEBALL,
  EXERCISE_TYPE_BASKETBALL,
  EXERCISE_TYPE_BENCH_PRESS,
  EXERCISE_TYPE_BENCH_SIT_UP,
  EXERCISE_TYPE_BIKING,
  EXERCISE_TYPE_BIKING_STATIONARY,
  EXERCISE_TYPE_BOOT_CAMP,
  EXERCISE_TYPE_BOXING,
  EXERCISE_TYPE_BURPEE,
  EXERCISE_TYPE_CALISTHENICS,
  EXERCISE_TYPE_CRICKET,
  EXERCISE_TYPE_CRUNCH,
  EXERCISE_TYPE_DANCING,
  EXERCISE_TYPE_DEADLIFT,
  EXERCISE_TYPE_DUMBBELL_CURL_LEFT_ARM,
  EXERCISE_TYPE_DUMBBELL_CURL_RIGHT_ARM,
  EXERCISE_TYPE_DUMBBELL_FRONT_RAISE,
  EXERCISE_TYPE_DUMBBELL_LATERAL_RAISE,
  EXERCISE_TYPE_DUMBBELL_TRICEPS_EXTENSION_LEFT_ARM,
  EXERCISE_TYPE_DUMBBELL_TRICEPS_EXTENSION_RIGHT_ARM,
  EXERCISE_TYPE_DUMBBELL_TRICEPS_EXTENSION_TWO_ARM,
  EXERCISE_TYPE_ELLIPTICAL,
  EXERCISE_TYPE_EXERCISE_CLASS,
  EXERCISE_TYPE_FENCING,
  EXERCISE_TYPE_FOOTBALL_AMERICAN,
  EXERCISE_TYPE_FOOTBALL_AUSTRALIAN,
  EXERCISE_TYPE_FORWARD_TWIST,
  EXERCISE_TYPE_FRISBEE_DISC,
  EXERCISE_TYPE_GOLF,
  EXERCISE_TYPE_GUIDED_BREATHING,
  EXERCISE_TYPE_GYMNASTICS,
  EXERCISE_TYPE_HANDBALL,
  EXERCISE_TYPE_HIGH_INTENSITY_INTERVAL_TRAINING,
  EXERCISE_TYPE_HIKING,
  EXERCISE_TYPE_ICE_HOCKEY,
  EXERCISE_TYPE_ICE_SKATING,
  EXERCISE_TYPE_JUMPING_JACK,
  EXERCISE_TYPE_JUMP_ROPE,
  EXERCISE_TYPE_LAT_PULL_DOWN,
  EXERCISE_TYPE_LUNGE,
  EXERCISE_TYPE_MARTIAL_ARTS,
  EXERCISE_TYPE_PADDLING,
  EXERCISE_TYPE_PARAGLIDING,
  EXERCISE_TYPE_PILATES,
  EXERCISE_TYPE_PLANK,
  EXERCISE_TYPE_RACQUETBALL,
  EXERCISE_TYPE_ROCK_CLIMBING,
  EXERCISE_TYPE_ROLLER_HOCKEY,
  EXERCISE_TYPE_ROWING,
  EXERCISE_TYPE_ROWING_MACHINE,
  EXERCISE_TYPE_RUGBY,
  EXERCISE_TYPE_RUNNING,
  EXERCISE_TYPE_RUNNING_TREADMILL,
  EXERCISE_TYPE_SAILING,
  EXERCISE_TYPE_SCUBA_DIVING,
  EXERCISE_TYPE_SKATING,
  EXERCISE_TYPE_SKIING,
  EXERCISE_TYPE_SNOWBOARDING,
  EXERCISE_TYPE_SNOWSHOEING,
  EXERCISE_TYPE_SOCCER,
  EXERCISE_TYPE_SOFTBALL,
  EXERCISE_TYPE_SQUASH,
  EXERCISE_TYPE_SQUAT,
  EXERCISE_TYPE_STAIR_CLIMBING,
  EXERCISE_TYPE_STAIR_CLIMBING_MACHINE,
  EXERCISE_TYPE_STRENGTH_TRAINING,
  EXERCISE_TYPE_STRETCHING,
  EXERCISE_TYPE_SURFING,
  EXERCISE_TYPE_SWIMMING_OPEN_WATER,
  EXERCISE_TYPE_SWIMMING_POOL,
  EXERCISE_TYPE_TABLE_TENNIS,
  EXERCISE_TYPE_TENNIS,
  EXERCISE_TYPE_UPPER_TWIST,
  EXERCISE_TYPE_VOLLEYBALL,
  EXERCISE_TYPE_WALKING,
  EXERCISE_TYPE_WATER_POLO,
  EXERCISE_TYPE_WEIGHTLIFTING,
  EXERCISE_TYPE_WHEELCHAIR,
  EXERCISE_TYPE_OTHER_WORKOUT,
  EXERCISE_TYPE_YOGA,
}

enum RecordClass {
  ActiveCaloriesBurnedRead,
  ActivityEventRead,
  ActivityLapRead,
  ActivitySessionRead,
  BasalBodyTemperatureRead,
  BasalMetabolicRateRead,
  BloodGlucoseRead,
  BloodPressureRead,
  BodyFatRead,
  BodyTemperatureRead,
  // BodyWaterMassRead,
  BoneMassRead,
  CervicalMucusRead,
  CyclingPedalingCadenceSeriesRead,
  DistanceRead,
  ElevationGainedRead,
  FloorsClimbedRead,
  HeartRateSeriesRead,
  // HeartRateVariabilityRmssdRead,
  HeightRead,
  HydrationRead,
  LeanBodyMassRead,
  MenstruationRead,
  NutritionRead,///not implemented yet
  OvulationTestRead,///not implemented yet
  OxygenSaturationRead,
  PowerSeriesRead,///not implemented yet
  RepetitionsRead,
  RespiratoryRateRead,
  RestingHeartRateRead,
  SexualActivityRead,///not implemented yet
  SleepSessionRead,
  SleepStageRead,
  SpeedSeriesRead,
  StepsRead,
  StepsCadenceSeriesRead,
  SwimmingStrokesRead,///not implemented yet
  TotalCaloriesBurnedRead,
  Vo2MaxRead,
  WheelchairPushesRead,
  WeightRead,

  ActiveCaloriesBurnedWrite,
  ActivityEventWrite,
  ActivityLapWrite,
  ActivitySessionWrite,
  BasalBodyTemperatureWrite,
  BasalMetabolicRateWrite,
  BloodGlucoseWrite,
  BloodPressureWrite,
  BodyFatWrite,
  BodyTemperatureWrite,
  // BodyWaterMassWrite,
  BoneMassWrite,
  CervicalMucusWrite,
  CyclingPedalingCadenceSeriesWrite,
  DistanceWrite,
  ElevationGainedWrite,
  FloorsClimbedWrite,
  HeartRateSeriesWrite,
  // HeartRateVariabilityRmssdWrite,
  HeightWrite,
  HydrationWrite,
  LeanBodyMassWrite,
  MenstruationWrite,
  NutritionWrite,
  OvulationTestWrite,
  OxygenSaturationWrite,
  PowerSeriesWrite,
  RepetitionsWrite,
  RespiratoryRateWrite,
  RestingHeartRateWrite,
  SexualActivityWrite,
  SleepSessionWrite,
  SleepStageWrite,
  SpeedSeriesWrite,
  StepsWrite,
  StepsCadenceSeriesWrite,
  SwimmingStrokesWrite,
  TotalCaloriesBurnedWrite,
  Vo2MaxWrite,
  WheelchairPushesWrite,
  WeightWrite
}
