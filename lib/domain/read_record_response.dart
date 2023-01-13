import 'package:health_connect/domain/record_model/_base/record.dart';

abstract class ReadRecordResponse {
  static RecordResponseModel<Record> success(
          {required String pageToken, required List<Record> records}) =>
      RecordResponseModel(pageToken: pageToken, records: records);

  static ReadRecordError error({required int code, required String message}) =>
      ReadRecordError(code: code, message: message);
}

class RecordResponseModel<T extends Record> extends ReadRecordResponse {
  final String pageToken;
  final List<T> records;

  RecordResponseModel({required this.pageToken, required this.records});
}

class ReadRecordError extends ReadRecordResponse {
  final int code;
  final String? message;

  ReadRecordError({required this.code, this.message});
}
