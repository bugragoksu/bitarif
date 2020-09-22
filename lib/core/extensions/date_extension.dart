extension DateExtension on DateTime {
  String get toParsedString =>
      "${this.year.toString()}-${this.month.toString()}-${this.day.toString()}";
}
