abstract class IResponseModel<T> {
  T data;
  IErrorModel error;
}

abstract class IErrorModel<T> {}

class ResponseModel<T> extends IResponseModel<T> {
  final T data;
  final IErrorModel error;

  ResponseModel({this.data, this.error});
}
