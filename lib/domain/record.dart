import 'package:health_connect/constants.dart';
import 'package:health_connect/domain/metada.dart';

class Record {
  final Metadata metadata;

  Record({required this.metadata});

  factory Record.fromJson(Map<String, dynamic> json){
    final metadata = Metadata.fromJson(json[Constants.metadata]);
    return Record(
      metadata: metadata
    );
  }
}
