import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/record_model/_base/interval_record.dart';
import 'package:health_connect/domain/units/energy_unit.dart';

class TotalCaloriesBurnedRecord extends IntervalRecord {
  final EnergyUnit energy;

  TotalCaloriesBurnedRecord({required this.energy, required super.metadata});

  factory TotalCaloriesBurnedRecord.fromJson(Map<String, dynamic> json) {
    final parent = IntervalRecord.fromJson(json);
    return TotalCaloriesBurnedRecord(
        metadata: parent.metadata,
        energy: EnergyUnit.fromJson(json[Constants.energy]));
  }
}
