import '../constants/enums/http_types_enum.dart';

extension NetworkTypeExtension on HttpTypes {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return "GET";
      case HttpTypes.POST:
        return "POST";
      case HttpTypes.PUT:
        return "PUT";
      default:
        throw "TYPE ERROR";
    }
  }
}
