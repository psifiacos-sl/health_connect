import 'package:health_connect/domain/record_model/_base/record.dart';
import 'package:health_connect/domain/record_response_model.dart';

abstract class ReadResponse<T> {
  static ReadResponseSuccess<RecordResponseModel> success<T>({
    required RecordResponseModel value,
  }) =>
      ReadResponseSuccess(recordResponseModel: value);

  static ReadRecordResponseError<ReadRecordError> error<T>(
          {required ReadRecordError error}) =>
      ReadRecordResponseError(
        error: error,
      );
}

class ReadResponseSuccess<T> extends ReadResponse<RecordResponseModel> {
  final RecordResponseModel recordResponseModel;

  ReadResponseSuccess({required this.recordResponseModel});
}

class ReadRecordResponseError<T> extends ReadResponse<ReadRecordError> {
  final ReadRecordError error;

  ReadRecordResponseError({required this.error});
}

class ReadRecordError {
  final int code;
  final String? message;

  ReadRecordError({required this.code, this.message});
}
