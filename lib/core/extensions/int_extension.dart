extension IntDurationExtension on int {
  Duration get toMillisDuration => Duration(milliseconds: this);
  Duration get toSecondDuration => Duration(seconds: this);
}
