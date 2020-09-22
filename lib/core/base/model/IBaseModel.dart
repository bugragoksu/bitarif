abstract class IBaseModel<T> {
  Map<String, Object> toJson();
  fromJson(Map<String, Object> json);
}
