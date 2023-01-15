import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/units/data_unit.dart';
import 'package:health_connect/enums.dart';

class MassUnit extends DataUnit {
  final double value;
  final MassTypes type;

  MassUnit({required this.value, required this.type});

  factory MassUnit.fromJson(Map<String, dynamic> json) {
    return MassUnit(
        value: json[Constants.value],
        type: MassTypes.values
            .firstWhere((element) => element.name == json[Constants.type]));
  }

  @override
  String get unit => type == MassTypes.POUNDS
      ? "pounds"
      : type == MassTypes.OUNCES
          ? "ounces"
          : type == MassTypes.MICROGRAMS
              ? "micrograms"
              : type == MassTypes.MILLIGRAMS
                  ? "milligrams"
                  : type == MassTypes.KILOGRAMS
                      ? "kilograms"
                      : "grams";

  @override
  num get data => value;
}
