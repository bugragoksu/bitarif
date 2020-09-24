import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enums/http_types_enum.dart';
import '../../extensions/network_extension.dart';
import 'ICoreDio.dart';
import 'IResponseModel.dart';

part './network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());
    this.httpClientAdapter = DefaultHttpClientAdapter();
  }

  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, dynamic> queryParameters,
      void Function(int, int) onReceiveProgress,
      String token}) async {
    final response = await request(path,
        data: data,
        queryParameters: queryParameters,
        options: token != null
            ? Options(
                method: type.rawValue,
                headers: {"Authorization": "Token $token"})
            : Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        final model = _responseParser<R, T>(parseModel, response.data);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError(response.data["message"]));
    }
  }
}
