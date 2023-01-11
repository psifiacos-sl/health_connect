import 'package:health_connect/domain/record_model/_base/record.dart';

class RecordResponseModel<T extends Record> {
  final String pageToken;
  final List<T> records;

  RecordResponseModel({required this.pageToken, required this.records});
}
