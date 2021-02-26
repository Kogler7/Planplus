//内置开发者信息
import 'package:flutter_planplus/config/image.dart';
import 'package:flutter_planplus/model/user_info.dart';

class DevInfo{
  static const UserInfo Kogler = UserInfo(
    name: 'Kogler',
    email: 'Kogler_S@outlook.com',
    avatar: KImage.avatar,
    bkground: KImage.userBack,
  );
  static const UserInfo Maplenight = UserInfo(
    name: '枫林晚',
    email: 'Maple_night@outlook.com',
    avatar: KImage.avatar,
    bkground: KImage.userBack,
  );
  static const UserInfo Sureyan = UserInfo(
    name: 'Sureyan',
    email: 'Sureyan@outlook.com',
    avatar: KImage.avatar,
    bkground: KImage.userBack,
  );
}