import 'package:health_connect/constants.dart';

class DataOrigin {
  String packageName;

  DataOrigin({required this.packageName});

  factory DataOrigin.empty(){
    return DataOrigin(packageName: "");
  }

  factory DataOrigin.fromJson(Map<String, dynamic> json){
    return DataOrigin(packageName: json[Constants.packageName]);
  }
}
