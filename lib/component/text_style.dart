import 'package:flutter/material.dart';
import 'package:watch_store/gen/fonts.gen.dart';
import 'package:watch_store/res/colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle textFieldLabel = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: AppColors.title);

  static const TextStyle catTitle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.title);

  static const TextStyle selectedTab = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.title);

  static TextStyle unSelectedTab = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.title.withAlpha(125));

  static const TextStyle productTitle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.title);

  static TextStyle productCaption = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: AppColors.title.withAlpha(150));

  static TextStyle productDetail = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: AppColors.title.withAlpha(190));

  static const TextStyle textFieldStyle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.title);

  static const TextStyle textFieldHint = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color: AppColors.hint);

  static const TextStyle mainButton = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.mainButtonText);

  static const TextStyle primaryStyle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryColor);

  static const TextStyle avatarText = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.title);

  static const TextStyle appBarText = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColors.title);

  static const TextStyle error = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.red);

  static const TextStyle btmNavActiveItem = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.btmNavActiveItem);

  static const TextStyle btmNavInActiveItem = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.btmNavInActiveItem);

  static const TextStyle searchHint = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.hint);

  static const TextStyle oldPrice = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.oldPrice,
      decoration: TextDecoration.lineThrough);

  static const TextStyle productPrice = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 16,
      fontWeight: FontWeight.w300,
      color: AppColors.title);

  static const TextStyle discount = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.mainButtonText);

  static const TextStyle productTimer = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryColor);

  static const TextStyle amazingProducts = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.amazingColor);

  static const TextStyle bestSellersProducts = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.bestSellersColor);

  static const TextStyle newestProducts = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.newestColor);

  static const TextStyle tagTitle = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: Colors.white);

  static const TextStyle loadingText = TextStyle(
      fontFamily: FontFamily.dana,
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: AppColors.loadingColor);
}
