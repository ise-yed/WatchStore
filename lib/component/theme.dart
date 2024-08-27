import 'package:flutter/material.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

import '../gen/fonts.gen.dart';

ThemeData lightTheme() {
  return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Colors.black),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      radioTheme:RadioThemeData(
        fillColor: MaterialStateProperty.all(AppColors.loadingColor),
      ) ,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MaterialStateColor.resolveWith((states) {
          if (states.contains(MaterialState.focused)) {
            return AppColors.focusedTextField;
          } else {
            return AppColors.unFocusedTextField;
          }
        }),
        contentPadding: const EdgeInsets.all(AppDimens.medium),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            borderSide: const BorderSide(color: AppColors.borderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            borderSide: const BorderSide(color: AppColors.borderColor)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            borderSide: const BorderSide(color: AppColors.focusedBorderColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            borderSide: const BorderSide(color: Colors.red)),
        errorStyle: const TextStyle(
            fontFamily: FontFamily.dana,
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Colors.red),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimens.medium),
            borderSide: const BorderSide(color: AppColors.focusedBorderColor)),
      ));

}
