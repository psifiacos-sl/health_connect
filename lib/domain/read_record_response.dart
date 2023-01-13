import 'package:health_connect/domain/record_model/_base/record.dart';
import 'package:health_connect/domain/record_response_model.dart';

abstract class ReadRecordResponse {
  static RecordResponseModel success(
          {required String pageToken, required List<Record> records}) =>
      RecordResponseModel(pageToken: pageToken, records: records);

  static ReadRecordError error({required int code, required String message}) =>
      ReadRecordError(code: code, message: message);
}

class RecordResponseModel extends ReadRecordResponse {
  final String pageToken;
  final List<Record> records;

  RecordResponseModel({required this.pageToken, required this.records});
}

class ReadRecordError extends ReadRecordResponse {
  final int code;
  final String? message;

  ReadRecordError({required this.code, this.message});
}
