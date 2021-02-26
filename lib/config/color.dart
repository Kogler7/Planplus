import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
const MaterialColor black = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFF000000),
    100: const Color(0xFF000000),
    200: const Color(0xFF000000),
    300: const Color(0xFF000000),
    400: const Color(0xFF000000),
    500: const Color(0xFF000000),
    600: const Color(0xFF000000),
    700: const Color(0xFF000000),
    800: const Color(0xFF000000),
    900: const Color(0xFF000000),
  },
);

//主要颜色常量
class KColor {
  static const Color primaryColor = Colors.cyan; //默认主要颜色
  static const Color primaryHighlightColor = Colors.blue; //默认主要颜色（强调）
  static const Color secondaryColor = Colors.orange; //默认次要颜色
  static const Color secondaryHighlightColor = Colors.deepOrange; //默认次要颜色（强调）
  static const Color tipColor = Colors.lightGreen; //默认提示颜色
  static const Color tipHighlightColor = Colors.greenAccent; //默认提示颜色（强调）
  static const Color backGround = Color(0xFFFFF5E2); //默认背景颜色
  // Test
  static const Color defaultTextColor = Colors.redAccent; //默认文本颜色
  static const Color defaultButtonColor = Colors.redAccent; //默认按钮颜色
  static const Color defaultSwitchColor = Colors.redAccent; //默认切换按钮颜色
  static const Color defaultCheckBoxColor = Colors.redAccent; //默认复选框按钮颜色
  static const Color toastBgColor = Colors.redAccent; //toast提示背景颜色
  static const Color watingColor = Colors.redAccent; //加载数据提示颜色
  static const Color toastTextColor = Colors.white; //toast提示文本颜色
  static const Color indexTabSelectedColor = Colors.red; //选项卡按钮选中颜色
  static const Color indexTabUnselectedColor = Colors.grey; //选项卡按钮选未中颜色
///text
  static const Color gotoItemTextColor = Colors.black54; //图标文本颜色
  static const Color gotoItemIconColor = Colors.grey; //图标箭头颜色
}

class KRndColor {
  static Color get newColor => rndColors[Random.secure().nextInt(10)];

  static const rndColors = [
    Color(0xAA795548),
    Color(0xAA673AB7),
    Color(0xAAE91E63),
    Color(0xAAF44336),
    Color(0xAAFFA000),
    Color(0xAAFFEE3B),
    Color(0xAACDDC39),
    Color(0xAA4CAF50),
    Color(0xAA009688),
    Color(0xAA00BCD4),
    Color(0xAA03A9F4),
  ];
}
