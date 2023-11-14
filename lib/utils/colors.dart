import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color.fromARGB(255, 216, 38, 38);
  static const secondaryColor = Color(0xFF00B4D5);
  static const tertiaryColor = Color(0xFFF8F8F8);
  static const backGroundColor = tertiaryColor;
  static const borderColor = Color(0xFF757575);
  static const textColor = Color(0xFF303030);
  static const textColorAccent = Color(0xFFC5C5C5);
  static const hintTextColor = borderColor;

  static const extraWhiteLight = Color.fromARGB(255, 255, 255, 255);

  static const errorColor = Color(0XFFFF6363);
  static const primeYello = Color(0xFFFFCE50);

  static const extraWhite = Color(0xFFFFFFFF);

  static const unselectedGrey = Color(0xFFB7B7B7);
  static const textGreyColor = Color.fromRGBO(117, 117, 117, 1);
  static const lightGreyColor = Color.fromRGBO(73, 73, 73, 0.06);

  static const accepted = Color.fromRGBO(0, 167, 67, 1);
  static const rejected = Color.fromRGBO(255, 59, 59, 1);

  static Color lightPurple = const Color(0xFF9C20BB).withOpacity(0.06);
  static Color shadowColor = const Color(0xFF494949).withOpacity(0.06);
  static Color darkBlue = const Color(0xFF113AB6);
  static Color offWhite = const Color(0xFFE8EDFF);
  static Color red = const Color(0xFFC70606);
  static Color lred = const Color(0xFFE37070);
  static Color lightBlack = const Color(0xFF616161);
  static Color orange = const Color(0xFFF45959);
  static Color lightRed = const Color(0xFFDF6D6D);
  static Color lightGreen = const Color(0xFFA4F0B5);

  static final shimmerBase = Colors.grey.withOpacity(0.20);
  static const Color shimmerHighlight = Color(0xFFE1E1E1);

  static const Color lGrey = Color(0xFFD9D9D9);
  static const Color secondaryTextColor = Color(0xFFAAAAAA);

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
