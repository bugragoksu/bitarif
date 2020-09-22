part of "../core_dio.dart";

extension _CoreDioOperations on CoreDio {
  R _responseParser<R, T extends BaseModel>(BaseModel model, dynamic data) {
    if (data is List) {
      return data.map<T>((e) => model.fromJson(e)).toList() as R;
    } else if (data is Map) {
      return model.fromJson(data) as R;
    }
    return data as R;
  }
}
