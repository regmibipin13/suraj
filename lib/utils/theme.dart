import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData basicTheme() {
  const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, 
      statusBarBrightness: Brightness.light);

  return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backGroundColor,
      textTheme: getBasicTextTheme(),
      colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primaryColor,
          background: AppColors.backGroundColor,
          outline: AppColors.lGrey,
          onSurface: AppColors.lGrey,
          onBackground: AppColors.textColor,
          shadow: AppColors.shadowColor,
          error: AppColors.errorColor));
}

TextTheme getBasicTextTheme() {
  return ThemeData.light().textTheme.copyWith().apply(
      bodyColor: AppColors.textColor,
      displayColor: AppColors.textColor,
      decorationColor: AppColors.secondaryTextColor);
}

TextTheme getDarkTextTheme() {
  return ThemeData.light().textTheme.copyWith().apply(
      bodyColor: AppColors.backGroundColor,
      displayColor: AppColors.backGroundColor,
      decorationColor: AppColors.secondaryTextColor);
}
