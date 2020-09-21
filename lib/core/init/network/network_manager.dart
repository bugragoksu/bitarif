import 'package:dio/dio.dart';

import '../../constants/server/server_constants.dart';
import 'ICoreDio.dart';
import 'core_dio.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  ICoreDio coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: ServerConstants.API_URL,
    );
    coreDio = CoreDio(baseOptions);
  }
}
