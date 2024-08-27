

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension SizedBoxExtension on num{
  SizedBox get height =>SizedBox(height: toDouble(),);
  SizedBox get width =>SizedBox(width: toDouble(),);
}

extension IntExtension on int{
  String get separateWithComma{
    final numberFormat=NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return int.parse("0x$hexColor");
    }
  }
}