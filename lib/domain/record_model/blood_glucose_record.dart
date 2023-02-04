import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/instantaneous_record.dart';
import 'package:health_connect/domain/units/blood_glucose_unit.dart';
import 'package:health_connect/domain/units/data_no_unit.dart';
import 'package:health_connect/enums.dart';

class BloodGlucoseRecord extends InstantaneousRecord {
  final BloodGlucoseUnit level;
  final DataNoUnit specimenSource, mealType, relationToMeal;

  BloodGlucoseRecord(
      {required this.level,
      required this.specimenSource,
      required this.mealType,
      required this.relationToMeal,
      required super.metadata,
      required super.time,
      super.zoneOffset});

  factory BloodGlucoseRecord.fromJson(Map<String, dynamic> json) {
    final parent = InstantaneousRecord.fromJson(json);
    return BloodGlucoseRecord(
        metadata: parent.metadata,
        time: parent.time,
        specimenSource: DataNoUnit(SpecimenSources.values
            .firstWhere(
                (element) => element.name == json[Constants.specimenSource],
                orElse: () => SpecimenSources.SPECIMEN_SOURCE_UNKNOWN)
            .index),
        mealType: DataNoUnit(MealType.values
            .firstWhere((element) => element.name == json[Constants.mealType],
                orElse: () => MealType.MEAL_TYPE_UNKNOWN)
            .index),
        relationToMeal: DataNoUnit(RelationToMeals.values
            .firstWhere(
                (element) => element.name == json[Constants.relationToMeal],
                orElse: () => RelationToMeals.RELATION_TO_MEAL_UNKNOWN)
            .index),
        zoneOffset: parent.zoneOffset,
        level: BloodGlucoseUnit.fromJson(json[Constants.level]));
  }
}
