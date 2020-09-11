import 'package:flutter/cupertino.dart';

extension DoubleExtension on double {
  SizedBox get toHeightSizedBox => SizedBox(height: this);
  SizedBox get toWidthSizedBox => SizedBox(width: this);
}
