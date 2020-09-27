extension ListExtension on List {
  bool get isNotNulAndNotEmpty =>
      this == null ? false : this.isEmpty ? false : true;
}
