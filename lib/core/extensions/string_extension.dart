import 'package:easy_localization/easy_localization.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

extension StringExtension on String {
  String get locale => this.tr();
  bool get isNotNulAndNotEmpty =>
      this == null ? false : this.isEmpty ? false : true;
  String get toSha256 => sha256.convert(utf8.encode(this)).toString();
}
