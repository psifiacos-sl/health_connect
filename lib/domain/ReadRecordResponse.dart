import 'package:health_connect/domain/record.dart';

abstract class ReadRecordResponse<T> {
  static ReadRecordResponseSuccess<List<Record>> success<T>({
    required List<Record> value,
  }) =>
      ReadRecordResponseSuccess(records: value);

  static ReadRecordResponseError<ReadRecordError> error<T>(
          {required ReadRecordError error}) =>
      ReadRecordResponseError(
        error: error,
      );
}

class ReadRecordResponseSuccess<T> extends ReadRecordResponse<List<Record>> {
  final List<Record> records;

  ReadRecordResponseSuccess({required this.records});
}

class ReadRecordResponseError<T>
    extends ReadRecordResponse<ReadRecordError> {
  final ReadRecordError error;

  ReadRecordResponseError({required this.error});
}

class ReadRecordError {
  final int code;

  ReadRecordError({required this.code});
}
