import 'package:flutter/material.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
      backgroundColor:
          const MaterialStatePropertyAll<Color>(AppColors.primaryColor),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.medium))));

  static ButtonStyle continueShoppingButtonStyle = ButtonStyle(
      backgroundColor:
      const MaterialStatePropertyAll<Color>(AppColors.continueShopping),
      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.medium))));
}
