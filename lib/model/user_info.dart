import 'package:flutter/material.dart';

class UserInfo{
  final String name;
  final String email;
  final AssetImage avatar;
  final AssetImage bkground;

  const UserInfo({
    @required this.name,
    @required this.email,
    @required this.avatar,
    @required this.bkground,
  });
}