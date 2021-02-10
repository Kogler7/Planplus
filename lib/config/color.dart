import 'dart:ui';
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
class KColor{
  static const Color primarySwatchColor = Colors.blue;//默认主要颜色
  static const Color navigationBar = Colors.cyan;//默认导航栏颜色
  static const Color defaultTextColor = Colors.redAccent;//默认文本颜色
  static const Color defaultButtonColor = Colors.redAccent;//默认按钮颜色
  static const Color defaultSwitchColor = Colors.redAccent;//默认切换按钮颜色
  static const Color defaultCheckBoxColor = Colors.redAccent;//默认复选框按钮颜色
  static const Color toastBgColor = Colors.redAccent;//toast提示背景颜色
  static const Color watingColor = Colors.redAccent;//加载数据提示颜色
  static const Color toastTextColor = Colors.white;//toast提示文本颜色
  static const Color indexTabSelectedColor = Colors.red;//选项卡按钮选中颜色
  static const Color indexTabUnselectedColor = Colors.grey;//选项卡按钮选未中颜色
//text
  static const Color gotoItemTextColor = Colors.black54;//图标文本颜色
  static const Color gotoItemIconColor = Colors.grey;//图标箭头颜色
//FloatingActionButtons
  static const Color fabList = Colors.lightGreenAccent;//ListPageButton颜色
  static const Color fabTrack = Colors.white;//TrackPageButton颜色
  static const Color fabJudge = Colors.yellowAccent;//JudgePageButton颜色
}