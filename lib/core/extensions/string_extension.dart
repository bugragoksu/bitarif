import 'package:easy_localization/easy_localization.dart';

extension StringExtension on String {
  String get locale => this.tr();
  bool get isNotNulAndNotEmpty =>
      this == null ? false : this.isEmpty ? false : true;
}
