import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/units/data_unit.dart';
import 'package:health_connect/enums.dart';

class PowerUnit extends DataUnit{
  final double value;
  final PowerTypes type;

  PowerUnit({required this.value, required this.type});

  factory PowerUnit.fromJson(Map<String, dynamic> json) {
    return PowerUnit(
        value: json[Constants.value],
        type: PowerTypes.values
            .firstWhere((element) => element.name == json[Constants.type]));
  }

  @override
  String get unit =>
      type == PowerTypes.KILOCALORIES_PER_DAY ? "kcal/day" : "Watts";

  @override
  num get data => value;
}
